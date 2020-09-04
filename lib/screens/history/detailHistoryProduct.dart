import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/screens/products/exploreProduct.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class DetailHistoryProduct extends StatefulWidget {
  final OrderModel orderModel;
  DetailHistoryProduct({this.orderModel});
  @override
  _DetailHistoryProductState createState() => _DetailHistoryProductState();
}

class _DetailHistoryProductState extends State<DetailHistoryProduct> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUserById(widget.orderModel.storeOwnerId[0]);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          iconTheme: IconThemeData(color: black),
          title: CustomText(
              text: 'Rincian Pesanan', size: 18.0, weight: FontWeight.w600)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                        text: 'Status',
                        size: 12.0,
                        color: black.withOpacity(0.6)),
                    CustomText(
                        text: widget.orderModel.status,
                        size: 14.0,
                        color: green,
                        weight: FontWeight.w600),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                            text: 'Tanggal Pembelian',
                            color: black.withOpacity(0.6),
                            size: 12.0),
                        CustomText(
                          text: DateTime.fromMillisecondsSinceEpoch(
                                  widget.orderModel.createdAt)
                              .toString(),
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Divider(),
                    CustomText(
                        text: widget.orderModel.id,
                        color: black.withOpacity(0.6))
                  ],
                ),
              )),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                        Icon(Icons.store, color: grey),
                        SizedBox(width: 5.0),
                        CustomText(
                            text: '${userProvider.userById?.name}',
                            weight: FontWeight.w600),
                        Spacer(),
                        InkWell(
                            onTap: () {},
                            child: CustomText(
                                text: 'Kunjungi Toko',
                                size: 12.0,
                                color: blue)),
                        Icon(Icons.chevron_right, size: 16.0, color: blue)
                      ]),
                      Divider(),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.orderModel.listProduct.length,
                        itemBuilder: (_, index) {
                          return Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(widget.orderModel
                                              .listProduct[index].image),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 3.0),
                                      ]),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CustomText(
                                        text: widget
                                            .orderModel.listProduct[index].name,
                                        weight: FontWeight.w600,
                                        line: 2,
                                        over: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5.0),
                                      CustomText(
                                        text: widget.orderModel
                                                .listProduct[index].quantity
                                                .toString() +
                                            '  Barang',
                                        size: 12.0,
                                      ),
                                      SizedBox(height: 5.0),
                                      CustomText(
                                        text: NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp ',
                                                decimalDigits: 0)
                                            .format(widget.orderModel
                                                .listProduct[index].price),
                                        color: Colors.red,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                        text: 'Detail Pengiriman',
                        size: 16.0,
                        color: black,
                        weight: FontWeight.w600),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'Kurir Pengiriman',
                              color: black.withOpacity(0.6),
                              size: 12.0),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text:
                                '${widget.orderModel.shipping.name} - ${widget.orderModel.shipping.type}',
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'No. Resi',
                              color: black.withOpacity(0.6),
                              size: 12.0),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: '1234567890',
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'Alamat Pengiriman',
                              color: black.withOpacity(0.6),
                              size: 12.0),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text:
                                '${widget.orderModel.address.addressDetail}, ${widget.orderModel.address.subDistrict}, ${widget.orderModel.address.city}, ${widget.orderModel.address.province}, ${widget.orderModel.address.posCode}',
                            line: 10,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                        text: 'Info Pembayaran',
                        size: 16.0,
                        color: black,
                        weight: FontWeight.w600),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'Metode Pembayaran',
                              color: black.withOpacity(0.6),
                              size: 12.0),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: 'ECOPAY',
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'Subtotal untuk Produk',
                              color: black.withOpacity(0.6),
                              size: 12.0),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(widget.orderModel.subTotalProduct),
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'Pengiriman',
                              color: black.withOpacity(0.6),
                              size: 12.0),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(widget.orderModel.shippingPrice),
                            line: 10,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomText(
                              text: 'Total Bayar',
                              color: black.withOpacity(0.6),
                              size: 12.0,
                              weight: FontWeight.w600),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(widget.orderModel.total),
                            color: Colors.red,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65.0,
        padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
        decoration: BoxDecoration(color: white, boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(3, 0), blurRadius: 3)
        ]),
        child: RaisedButton(
          color: green,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: CustomText(
              text: 'Beli Lagi',
              color: white,
              size: 16.0,
              weight: FontWeight.w700),
          onPressed: () {
           Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ExploreProductPage(),
                ));
          },
        ),
      ),
    );
  }
}
