import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/products/cartProduct.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailProduct({this.productModel});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUserById(widget.productModel.userId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          elevation: 0.0,
          iconTheme: IconThemeData(color: white),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart, color: white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartProduct(),
                      ));
                }),
            PopupMenuButton(
                offset: Offset(0, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                      },
                      child: Row(children: <Widget>[
                        Icon(Icons.home, color: yellow),
                        SizedBox(width: 5.0),
                        CustomText(text: 'Kembali ke Halaman Utama')
                      ]),
                    )),
                    PopupMenuItem(
                        child: Row(children: <Widget>[
                      Icon(Icons.help_outline, color: yellow),
                      SizedBox(width: 5.0),
                      CustomText(text: 'Butuh Bantuan?')
                    ]))
                  ];
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: black.withOpacity(0.9),
                                    child: Center(
                                      child: Hero(
                                        tag: 'ProductImage',
                                        child: Image.network(
                                          '${widget.productModel.image}',
                                        ),
                                      ),
                                    ),
                                  ))));
                },
                child: Hero(
                  tag: 'ProductImage',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: Image.network(
                      '${widget.productModel.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                        text: '${widget.productModel.name}',
                        size: 16,
                        weight: FontWeight.w500),
                    SizedBox(height: 20.0),
                    CustomText(
                        text: NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(widget.productModel.price),
                        size: 18,
                        color: Colors.red,
                        weight: FontWeight.w500),
                    SizedBox(height: 10.0),
                    Divider(),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      color: white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${userProvider.userById?.image}"),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 2.0),
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(
                                    text: userProvider.userById?.name ?? 'Loading ...',
                                    over: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on,
                                          size: 14.0, color: grey),
                                      SizedBox(width: 5.0),
                                      CustomText(
                                        text: "Kota User",
                                        color: grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    CustomText(
                        text: 'Informasi Produk',
                        size: 16.0,
                        weight: FontWeight.w500),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: 'Stok',
                        ),
                        CustomText(
                          text: '${widget.productModel.stock}',
                          color: grey,
                        ),
                      ],
                    ),
                    Divider(),
                    CustomText(
                        text: 'Deskripsi Produk',
                        size: 16.0,
                        weight: FontWeight.w500),
                    SizedBox(height: 5.0),
                    CustomText(
                      text: '${widget.productModel.description}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60.0,
          padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(3, 0), blurRadius: 3)
          ]),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: OutlineButton(
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  borderSide: BorderSide(color: yellow, width: 2.0),
                  child: Icon(Icons.chat, color: yellow),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderTrash(),
                    //     ));
                  },
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: OutlineButton(
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  borderSide: BorderSide(color: green, width: 2.0),
                  child: CustomText(
                      text: 'Beli', color: green, weight: FontWeight.w700),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderTrash(),
                    //     ));
                  },
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  color: green,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: white,
                        size: 15.0,
                      ),
                      CustomText(
                          text: 'Keranjang',
                          color: white,
                          weight: FontWeight.w700),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartProduct(),
                        ));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
