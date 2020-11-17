import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//  Models
import 'package:lingkung/models/productOrderModel.dart';
import 'package:lingkung/models/userModel.dart';
//  Providers
import 'package:lingkung/providers/productOrderProvider.dart';
//  Screens
import 'package:lingkung/screens/history/detailHistoryProduct.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class ProductFinish extends StatefulWidget {
  final UserModel userModel;
  ProductFinish({this.userModel});
  @override
  _ProductFinishState createState() => _ProductFinishState();
}

class _ProductFinishState extends State<ProductFinish> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<ProductOrderProvider>(context);
    orderProvider.loadSalesOwnerFinish(widget.userModel.id);
    return (orderProvider.salesOwnerFinish.isNotEmpty)
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            itemCount: orderProvider.salesOwnerFinish.length,
            itemBuilder: (_, index) {
              ProductOrderModel _order = orderProvider.salesOwnerFinish[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailHistoryProduct(orderModel: _order),
                    ),
                  );
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
                            color: black.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Icon(Icons.person, color: grey),
                                SizedBox(width: 5.0),
                                CustomText(
                                  text: _order.storeOwnerName,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          _order.listProduct[0].image),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 3.0,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: CustomText(
                                    text: _order.listProduct[0].name,
                                    line: 2,
                                    over: TextOverflow.ellipsis,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Divider(),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomText(
                                  text: '${_order.listProduct.length}  Produk',
                                  size: 10.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
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
                                          decimalDigits: 0,
                                        ).format(_order.total),
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Center(
            child: CustomText(
              text: 'Belum Ada Pesanan',
              size: 16.0,
              weight: FontWeight.w600,
            ),
          );
  }
}
