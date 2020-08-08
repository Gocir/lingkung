import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/products/cartProduct.dart';
import 'package:lingkung/screens/products/checkoutProduct.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailProduct({this.productModel});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  bool loading = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUserById(widget.productModel.userId);

    int totalCount = 0;
    if (userProvider.userModel.cartProduct.length > 0) {
      totalCount = userProvider.userModel.cartProduct.length;
    }

    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldStateKey,
            appBar: AppBar(
              backgroundColor: white,
              iconTheme: IconThemeData(color: black),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child:
                      Stack(alignment: Alignment.topRight, children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartProduct(),
                              ));
                        }),
                    Positioned(
                      right: 5.0,
                      top: 5.0,
                      child: Container(
                        height: 16.0,
                        width: 16.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red),
                        child: CustomText(
                            text: '$totalCount',
                            size: 10.0,
                            color: white,
                            weight: FontWeight.w500),
                      ),
                    )
                  ]),
                ),
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
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
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
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CustomText(
                                        text: userProvider.userById?.name ??
                                            'Loading ...',
                                        over: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5.0),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on,
                                              size: 12.0, color: grey),
                                          SizedBox(width: 5.0),
                                          CustomText(
                                            text: "Kota User",
                                            size: 12.0,
                                            color: grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                OutlineButton(
                                  color: white,
                                  highlightColor: white,
                                  highlightedBorderColor: green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  borderSide:
                                      BorderSide(color: green, width: 2.0),
                                  child: CustomText(
                                    text: 'Kunjungi',
                                    color: green,
                                    weight: FontWeight.w700,
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => OrderTrash(),
                                    //     ));
                                  },
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
                      highlightColor: white,
                      highlightedBorderColor: yellow,
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
                      highlightColor: white,
                      highlightedBorderColor: green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      borderSide: BorderSide(color: green, width: 2.0),
                      child: CustomText(
                          text: 'Beli', color: green, weight: FontWeight.w700),
                      onPressed: () async {
                        _settingModalBottomSheet(context);
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
                      onPressed: () async {
                        // cartBloc.addToCart(widget.productModel);
                        setState(() {
                          loading = true;
                        });
                        bool value = await userProvider.addToCartProduct(
                            productModel: widget.productModel,
                            quantity: _quantity);
                        if (value) {
                          print("Item added to cart");
                          _scaffoldStateKey.currentState.showSnackBar(SnackBar(
                              content: CustomText(
                            text: "Added To Cart!",
                            color: white,
                            weight: FontWeight.w600,
                          )));
                          userProvider.reloadUserModel();
                          setState(() {
                            loading = false;
                          });
                          return;
                        } else {
                          print("Item NOT added to cart");
                          setState(() {
                            loading = false;
                          });
                        }
                        print("lOADING SET TO FALSE");
                        setState(() {
                          loading = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ));
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 285.0,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close)),
                SizedBox(height: 16.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              color: white,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/noimage.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 2.0),
                              ]),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomText(
                              text: 'Rp 20000',
                              size: 16.0,
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: <Widget>[
                                CustomText(
                                  text: 'Stok : ',
                                  color: Colors.red,
                                ),
                                CustomText(
                                  text: '10',
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: CustomText(text: 'Jumlah')),
                      InkWell(
                          onTap: () {
                            if (_quantity != 1) {
                              setState(() {
                                _quantity -= 1;
                              });
                            }
                          },
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (_quantity != 1) ? yellow : grey,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Icon(Icons.remove,
                                  color: (_quantity != 1) ? yellow : grey,
                                  size: 14.0))),
                      SizedBox(width: 10.0),
                      CustomText(text: '$_quantity'),
                      SizedBox(width: 10.0),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _quantity += 1;
                            });
                          },
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child:
                                  Icon(Icons.add, color: white, size: 14.0))),
                    ]),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: green,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomText(
                        text: 'Beli Sekarang',
                        color: white,
                        weight: FontWeight.w700),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutProduct(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
