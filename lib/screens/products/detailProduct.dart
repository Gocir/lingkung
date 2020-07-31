import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailProduct({this.productModel});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // userProvider.reloadUserModel(widget.productModel.userId);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          elevation: 0.0,
          iconTheme: IconThemeData(color: white),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.shopping_cart, color: white),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                        pageBuilder: (BuildContext context, _, __) => GestureDetector(
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
                  height: MediaQuery.of(context).size.width/1.2,
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
                    text: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(widget.productModel.price),
                    size: 18,
                    color: green,
                    weight: FontWeight.w500
                  ),
                  SizedBox(height: 10.0),
                  // Divider(),
                  // Card(
                  //   child: ListTile(
                  //       leading: Container(
                  //           height: 60.0,
                  //           width: 60.0,
                  //           child: Image.asset(
                  //             "assets/images/user.png",
                  //             fit: BoxFit.cover,
                  //           )),
                  //       title: CustomText(
                  //           text: (userProvider.userModel.id == widget.productModel.userId) ? '${userProvider.userModel.name}' : null,
                  //           weight: FontWeight.w500),
                  //       dense: true),
                  // ),
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
                        color: yellow,
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderTrash(),
                    //     ));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
