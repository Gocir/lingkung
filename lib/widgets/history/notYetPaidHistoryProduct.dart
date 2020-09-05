import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/providers/orderProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class NotYetPaidHistoryProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);
    orderProvider.loadOrderNYP(userProvider.user.uid);
    return (orderProvider.orderNYP.isNotEmpty)
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10.0),
            itemCount: orderProvider.orderNYP.length,
            itemBuilder: (_, index) {
              OrderModel _order = orderProvider.orderNYP[index];
              userProvider.loadUserById(_order.storeOwnerId[0]);
              return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DetailHistoryProduct(
                        //           orderModel: _order),
                        //     ));
                      },
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                                color: yellow.withOpacity(0.6),
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: CustomText(
                                        text: _order.status,
                                        size: 12,
                                        color: black.withOpacity(0.6)))),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(Icons.store, color: grey),
                                        SizedBox(width: 5.0),
                                        CustomText(
                                            text: (userProvider
                                                        .userById?.name !=
                                                    null)
                                                ? '${userProvider.userById?.name}'
                                                : 'Loading ...',
                                            weight: FontWeight.w600)
                                      ]),
                                  Divider(),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(_order
                                                    .listProduct[0].image),
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
                                      SizedBox(width: 10.0),
                                      CustomText(
                                        text: _order.listProduct[0].name,
                                        weight: FontWeight.w600,
                                        line: 3,
                                        over: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Divider(),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CustomText(
                                          text: (_order.listProduct.length == 0)
                                              ? '0'
                                              : '${_order.listProduct.length}  Produk',
                                          size: 10.0),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Total Pembayaran: ',
                                          style: TextStyle(
                                            color: black,
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(_order.total),
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ])),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 45.0,
                                        child: RaisedButton(
                                          color: green,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: CustomText(
                                                  text: 'Bayar Sekarang',
                                                  color: white,
                                                  weight: FontWeight.w700)),
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => UpdateAddress(
                                            //           addressModel: userProvider
                                            //               .userModel.addressModel[index]),
                                            //     ));
                                          },
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
                text: 'Belanja dulu, yuk!',
                size: 16.0,
                weight: FontWeight.w600));
  }
}
