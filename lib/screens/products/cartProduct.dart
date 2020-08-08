import 'package:flutter/material.dart';
import 'package:lingkung/providers/cartBloc.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

// Widget
import 'package:lingkung/widgets/cartProductLisTile.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  CartProduct({Key key}) : super(key: key);
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  bool loading = false;
  bool _isChecked = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    var cartBloc = Provider.of<CartBloc>(context);
    var cartProduct = cartBloc.cart;
    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldStateKey,
            appBar: AppBar(
              backgroundColor: white,
              iconTheme: IconThemeData(color: black),
              title: CustomText(
                text: 'Keranjang',
                color: black,
                size: 18.0,
                weight: FontWeight.w600,
              ),
            ),
            body: (userProvider.userModel.cartProduct.length != null) || (userProvider.userModel.cartProduct != null)
                ?
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: userProvider.userModel.cartProduct.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                    value: _isChecked,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _isChecked = value;
                                      });
                                    },
                                    activeColor: blue,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${userProvider.userModel.cartProduct[index].image}"),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 3.0),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CustomText(
                                          text:
                                              "${userProvider.userModel.cartProduct[index].name}",
                                          line: 2,
                                          over: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5.0),
                                        CustomText(
                                          text:
                                              "${userProvider.userModel.cartProduct[index].price}",
                                          color: Colors.red,
                                          size: 16.0,
                                          weight: FontWeight.w600,
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  loading = true;
                                                });
                                                bool value = await userProvider
                                                    .removeFromCart(
                                                        cartItem: userProvider
                                                            .userModel
                                                            .cartProduct[index]);
                                                if (value) {
                                                  userProvider
                                                      .reloadUserModel();
                                                  print("Item added to cartProduct");
                                                  _scaffoldStateKey.currentState
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Removed from Cart!")));
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  return;
                                                } else {
                                                  print("ITEM WAS NOT REMOVED");
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
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
                                                            color: yellow,
                                                            width: 2.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Icon(Icons.remove,
                                                        color: Colors.grey,
                                                        size: 14.0))),
                                            SizedBox(width: 10.0),
                                            CustomText(
                                                text:
                                                    '${userProvider.userModel.cartProduct[index].quantity}'),
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Icon(Icons.add,
                                                        color: Colors.grey,
                                                        size: 14.0))),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                  // CartProductLisTile()
                : Center(
                    child: CustomText(
                        text: 'Belum Ada Produk di Keranjangmu!',
                        size: 16.0,
                        weight: FontWeight.w600)),
            // ListView.builder(
            //   itemCount: cartProduct.length,
            //   itemBuilder: (context, index) {
            //     int giftIndex = cartProduct.keys.toList()[index];
            //     int count = cartProduct[giftIndex];
            //     return ListTile(
            //       leading: Container(
            //         height: 70,
            //         width: 70,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("assets/${giftIndex + 1}.jpg"),
            //             fit: BoxFit.fitWidth,
            //           ),
            //           borderRadius: BorderRadius.circular(12.0),
            //         ),
            //       ),
            //       title: Text('Item Count: $count'),
            //       trailing: RaisedButton(
            //         child: Text('Clear'),
            //         color: Theme.of(context).buttonColor,
            //         elevation: 1.0,
            //         splashColor: Colors.blueGrey,
            //         onPressed: () {
            //           cartProductBloc.clear(giftIndex);
            //         },
            //       ),
            //     );
            //   },
            // ),
            bottomNavigationBar: _buildTotalContainer(),
          );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 60.0,
      padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(3, 0), blurRadius: 3)
      ]),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                    text: "Total Harga", size: 16.0, weight: FontWeight.w600),
                CustomText(
                  text: "Rp 34.900",
                  color: Colors.red,
                ),
              ],
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
              child: CustomText(
                  text: 'Beli',
                  color: white,
                  size: 16.0,
                  weight: FontWeight.w700),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CartProduct(),
                //     ));
              },
            ),
          ),
        ],
      ),
    );
    // Container(
    //   height: 220.0,
    //   color: white,
    //   padding: EdgeInsets.all(16.0),
    //   child: Row(
    //     children: <Widget>[
    //       Column(
    //         children: <Widget>[
    //           Text(
    //             "Total Keuntungan",
    //             style: TextStyle(
    //                 color: Color(0xFF9BA7C6),
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           Text(
    //             "Rp 34.900",
    //             style: TextStyle(
    //                 color: Color(0xFF6C6D6D),
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 20.0,
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
    //         },
    //         child: Container(
    //           height: 50.0,
    //           decoration: BoxDecoration(
    //             color: green,
    //             borderRadius: BorderRadius.circular(20.0),
    //           ),
    //           child: Center(
    //             child: Text(
    //               "Beli",
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20.0,
    //       ),
    //     ],
    //   ),
    // );
  }
}
