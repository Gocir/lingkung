import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/cartPoductModel.dart';
import 'package:lingkung/screens/products/checkoutProduct.dart';
import 'package:provider/provider.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return loading
        ? Loading()
        : Consumer<UserProvider>(
          builder: (context, value, child) => Scaffold(
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
            body: (userProvider.userModel.cartProduct.isNotEmpty)
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: userProvider.userModel.cartProduct.length,
                    itemBuilder: (_, index) {
                      CartProductModel cartProduct = value.userModel.cartProduct[index];
                      value.loadUserById(cartProduct.storeOwnerId);
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Row(children: <Widget>[
                                // Checkbox(
                                //     value: _isChecked,
                                //     onChanged: (bool value) {
                                //       setState(() {
                                //         _isChecked = value;
                                //       });
                                //     },
                                //     activeColor: blue,
                                //   ),
                                Icon(Icons.store, color: grey),
                                SizedBox(width: 5.0),
                                CustomText(
                                    text: '${value.userById?.name}',
                                    weight: FontWeight.w600)
                              ]),
                              Divider(height: 0,),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                    value: 
                                        cartProduct.isCheck,
                                    onChanged: (bool value) {
                                      setState(() {
                                        cartProduct.isCheck = value;
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
                                                    cartProduct.image),
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
                                              "${cartProduct.name}",
                                          line: 2,
                                          over: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5.0),
                                        CustomText(
                                          text: NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(cartProduct.price),
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
                                                loading = true;
                                                bool value = await 
                                                    userProvider.removeFromCartProduct(
                                                        cartProduct: cartProduct);
                                                if (value) {
                                                  userProvider.reloadUserModel();
                                                  print("Removed from Cart!");
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
                                                    '${cartProduct.quantity}'),
                                            SizedBox(width: 10.0),
                                            InkWell(
                                                onTap: () {
                                                  
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
                            ],
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CustomText(
                        text: 'Belum Ada Produk di Keranjangmu!',
                        size: 16.0,
                        weight: FontWeight.w600)),
            bottomNavigationBar: Container(
              height: 55.0,
              padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(3, 0), blurRadius: 3)
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
                            text: "Total Harga",
                            size: 16.0,
                            weight: FontWeight.w600),
                        CustomText(
                          text: NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(0),
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
                        List<CartProductModel> convertedCart = [];
                        for (CartProductModel cartProduct
                            in value.userModel.cartProduct) {
                          if (cartProduct.isCheck) {
                            print(cartProduct.name);
                            convertedCart
                                .add(CartProductModel.fromMap(cartProduct.toMap()));
                            print(convertedCart);
                          }
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutProduct(
                                cartProductModel: convertedCart,
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
