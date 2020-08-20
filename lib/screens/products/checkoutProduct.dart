import 'package:flutter/material.dart';
import 'package:lingkung/screens/address/address.dart';
import 'package:lingkung/services/orderService.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
//  Models
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/models/userModel.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
//  Screens
import 'package:lingkung/screens/address/addressList.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:uuid/uuid.dart';

class CheckoutProduct extends StatefulWidget {
  final UserModel userModel;
  final AddressModel addressModel;
  final ProductModel productModel;
  final List<CartItemModel> cartItemModel;
  final int quantity;
  CheckoutProduct(
      {this.productModel,
      this.cartItemModel,
      this.userModel,
      this.addressModel,
      this.quantity});

  @override
  _CheckoutProductState createState() => _CheckoutProductState();
}

class _CheckoutProductState extends State<CheckoutProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  OrderServices _orderService = OrderServices();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              key: _scaffoldStateKey,
              backgroundColor: white,
              iconTheme: IconThemeData(color: black),
              title: CustomText(
                text: 'Pengiriman',
                color: black,
                size: 18.0,
                weight: FontWeight.w600,
              ),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomText(
                        text: 'Alamat Pengiriman',
                        weight: FontWeight.w600,
                      ),
                      InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AddressList(),
                            //   ));
                            showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0))),
                                context: context,
                                builder: (BuildContext context) {
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      padding: const EdgeInsets.all(8.0),
                                      itemCount: userProvider
                                          .userModel.addressModel.length,
                                      itemBuilder: (_, index) {
                                        return Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: ListTile(
                                                isThreeLine: true,
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                title: CustomText(
                                                  text: userProvider
                                                      .userModel
                                                      .addressModel[index]
                                                      .addressLabel,
                                                  size: 12.0,
                                                  weight: FontWeight.w600,
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CustomText(
                                                      text: userProvider
                                                          .userModel
                                                          .addressModel[index]
                                                          .recipientsName,
                                                      weight: FontWeight.w700,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    CustomText(
                                                      text: '62' +
                                                          userProvider
                                                              .userModel
                                                              .addressModel[
                                                                  index]
                                                              .phoNumber
                                                              .toString(),
                                                      size: 12.0,
                                                      // color: grey,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '${userProvider.userModel.addressModel[index].addressDetail}, ${userProvider.userModel.addressModel[index].subDistrict}, ${userProvider.userModel.addressModel[index].city}, ${userProvider.userModel.addressModel[index].province}, ${userProvider.userModel.addressModel[index].posCode}',
                                                      size: 12.0,
                                                      // color: grey,
                                                    ),
                                                  ],
                                                )));
                                      });
                                });
                          },
                          child: CustomText(
                              text: 'Ganti alamat', color: blue, size: 12.0)),
                    ],
                  ),
                  // Divider(),
                  SizedBox(height: 5.0),
                  Card(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                          dense: true,
                          isThreeLine: true,
                          title: CustomText(
                            text: (widget.addressModel == null)
                                ? userProvider
                                    .userModel.addressModel[0].addressLabel
                                : widget.addressModel.addressLabel,
                            size: 12.0,
                            weight: FontWeight.w600,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                text: userProvider.userModel.addressModel[0]
                                        .recipientsName +
                                    ' - 62${userProvider.userModel.addressModel[0].phoNumber}',
                                color: grey,
                                size: 10.0,
                              ),
                              CustomText(
                                text:
                                    '${userProvider.userModel.addressModel[0].addressDetail}, ${userProvider.userModel.addressModel[0].subDistrict}, ${userProvider.userModel.addressModel[0].city}, ${userProvider.userModel.addressModel[0].province} ${userProvider.userModel.addressModel[0].posCode}',
                                line: 1,
                                over: TextOverflow.ellipsis,
                                color: grey,
                                size: 10.0,
                              ),
                            ],
                          ))),
                  Divider(),
                  SizedBox(height: 10.0),
                  CustomText(
                    text: 'Ringkasan Pesanan',
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.0),
                  (widget.productModel == null)
                      ? Container(
                        height: 500.0,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8.0),
                            itemCount:
                                widget.cartItemModel.length,
                            itemBuilder: (_, index) {
                              return Card(
                                margin: const EdgeInsets.all(0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 10.0, 16.0, 16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Icon(Icons.store, color: grey),
                                        SizedBox(width: 5.0),
                                        CustomText(
                                            text: widget.cartItemModel[index].name,
                                            weight: FontWeight.w600)
                                      ]),
                                      Divider(),
                                      SizedBox(height: 10.0),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          CustomText(
                                            text: widget.cartItemModel[index].quantity.toString() +
                                                'x',
                                            color: grey,
                                            size: 18,
                                            weight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 16.0),
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                                color: white,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${widget.cartItemModel[index].image}"),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      offset:
                                                          Offset(0.0, 0.0),
                                                      blurRadius: 2.0),
                                                ]),
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
                                                  text: widget
                                                      .productModel.name,
                                                  line: 2,
                                                  over: TextOverflow.ellipsis,
                                                  weight: FontWeight.w500,
                                                ),
                                                SizedBox(height: 5.0),
                                                CustomText(
                                                  text: NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp',
                                                          decimalDigits: 0)
                                                      .format(widget
                                                          .cartItemModel[index]
                                                          .price),
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                      : Card(
                          margin: const EdgeInsets.all(0),
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Icon(Icons.store, color: grey),
                                  SizedBox(width: 5.0),
                                  CustomText(
                                      text: widget.userModel.name,
                                      weight: FontWeight.w600)
                                ]),
                                Divider(),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CustomText(
                                      text: widget.quantity.toString() + 'x',
                                      color: grey,
                                      size: 18,
                                      weight: FontWeight.w600,
                                    ),
                                    SizedBox(width: 16.0),
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          color: white,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${widget.productModel.image}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 2.0),
                                          ]),
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
                                            text: widget.productModel.name,
                                            line: 2,
                                            over: TextOverflow.ellipsis,
                                            weight: FontWeight.w500,
                                          ),
                                          SizedBox(height: 5.0),
                                          CustomText(
                                            text: NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp',
                                                    decimalDigits: 0)
                                                .format(
                                                    widget.productModel.price),
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  Divider(),
                  SizedBox(height: 10.0),
                  CustomText(
                    text: 'Opsi Pengiriman',
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.0),
                  Card(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'Reguler',
                          size: 12.0,
                          weight: FontWeight.w600,
                        ),
                        subtitle: CustomText(
                          text: 'TIKI - Rp20.000',
                          size: 10.0,
                        ),
                        trailing: Icon(Icons.chevron_right),
                      )),
                  Divider(),
                  SizedBox(height: 10.0),
                  CustomText(
                    text: 'Metode Pembayaran',
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.0),
                  Card(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'Transfer Bank - Bank BRI',
                          size: 12.0,
                          weight: FontWeight.w600,
                        ),
                        trailing: Icon(Icons.chevron_right),
                      )),
                ],
              ),
            )),
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
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(text: "Total Pembayaran"),
                        CustomText(
                          text: NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp', decimalDigits: 0)
                              .format(2000),
                          size: 16.0,
                          color: Colors.red,
                          weight: FontWeight.w700,
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
                      onPressed: () async {
                        if (widget.productModel.price == 0) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0)), //this right here
                                  child: Container(
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Your cart is empty',
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200.0,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.close)),
                                      SizedBox(height: 16.0),
                                      Container(
                                        height: 50.0,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Expanded(
                                              child: OutlineButton(
                                                color: white,
                                                highlightColor: white,
                                                highlightedBorderColor: green,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                borderSide: BorderSide(
                                                    color: green, width: 2.0),
                                                child: CustomText(
                                                    text: 'TIDAK',
                                                    color: green,
                                                    weight: FontWeight.w700),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Expanded(
                                              child: RaisedButton(
                                                color: green,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: CustomText(
                                                    text: 'YA, LANJUT',
                                                    color: white,
                                                    weight: FontWeight.w700),
                                                onPressed: () async {
                                                  var uuid = Uuid();
                                                  String id = uuid.v4();
                                                  _orderService.createOrder(
                                                      id: id,
                                                      userId:
                                                          userProvider.user.uid,
                                                      // address: '${userProvider.userModel.addressModel[0].addressDetail}, ${userProvider.userModel.addressModel[0].subDistrict}, ${userProvider.userModel.addressModel[0].city}, ${userProvider.userModel.addressModel[0].province} ${userProvider.userModel.addressModel[0].posCode}',
                                                      // address: userProvider.userModel.addressModel,
                                                      note:
                                                          "Some random description",
                                                      status: "waiting",
                                                      totalPrice: widget
                                                          .productModel.price,
                                                      listProduct: userProvider
                                                          .userModel
                                                          .cartProduct);
                                                  // for (CartItemModel cartItem
                                                  //     in userProvider.userModel
                                                  //         .cartProduct) {
                                                  //   bool value =
                                                  //       await userProvider
                                                  //           .removeFromCart(
                                                  //               cartItem:
                                                  //                   cartItem);
                                                  //   if (value) {
                                                  //     userProvider
                                                  //         .reloadUserModel();
                                                  //     print(
                                                  //         "Item added to cart");
                                                  //     _scaffoldStateKey
                                                  //         .currentState
                                                  //         .showSnackBar(SnackBar(
                                                  //             content: Text(
                                                  //                 "Removed from Cart!")));
                                                  //   } else {
                                                  //     print(
                                                  //         "ITEM WAS NOT REMOVED");
                                                  //   }
                                                  // }
                                                  _scaffoldStateKey.currentState
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Order created!")));
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
