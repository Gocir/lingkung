import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/productOrderModel.dart';
import 'package:lingkung/screens/products/exploreProduct.dart';
import 'package:lingkung/screens/history/shippingCode.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class DetailSalesProduct extends StatefulWidget {
  final ProductOrderModel orderModel;
  DetailSalesProduct({this.orderModel});
  @override
  _DetailSalesProductState createState() => _DetailSalesProductState();
}

class _DetailSalesProductState extends State<DetailSalesProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: CustomText(
          text: 'Rincian Pesanan',
          size: 18.0,
          weight: FontWeight.w600,
        ),
      ),
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
                        color: black.withOpacity(0.6),
                      ),
                      CustomText(
                        text: widget.orderModel.status,
                        size: 14.0,
                        color: green,
                        weight: FontWeight.w600,
                      ),
                      Divider(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                            text: 'Tanggal Pembelian',
                            color: black.withOpacity(0.6),
                            size: 12.0,
                          ),
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
                        color: black.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Icon(Icons.person, color: grey),
                          SizedBox(width: 5.0),
                          CustomText(
                            text: widget.orderModel.storeOwnerName,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
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
                                      image: NetworkImage(widget
                                          .orderModel.listProduct[index].image),
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
                                        text:
                                            '${widget.orderModel.listProduct[index].quantity}  Barang',
                                        size: 12.0,
                                      ),
                                      SizedBox(height: 5.0),
                                      CustomText(
                                        text: NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0,
                                        ).format(widget.orderModel
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
                        weight: FontWeight.w600,
                      ),
                      Divider(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: CustomText(
                              text: 'Kurir Pengiriman',
                              color: black.withOpacity(0.6),
                              size: 12.0,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomText(
                              text: widget.orderModel.shipping,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: CustomText(
                              text: 'No. Resi',
                              color: black.withOpacity(0.6),
                              size: 12.0,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomText(
                              text: (widget.orderModel.resi == null)
                                  ? "-"
                                  : widget.orderModel.resi,
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
                              text: widget.orderModel.address,
                              line: 10,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
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
                              text: 'POINT',
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
                              weight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomText(
                              text: NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(widget.orderModel.total),
                              color: Colors.red,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3, 0),
              blurRadius: 3,
            ),
          ],
        ),
        child: FlatButton(
          color: green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: CustomText(
            text: (widget.orderModel.status == "Belum Bayar")
                ? 'Hubungi Pemesan'
                : (widget.orderModel.status == "Dikemas")
                    ? 'Atur Pengiriman'
                    : 'Hubungi Pemesan',
            color: white,
            size: 16.0,
            weight: FontWeight.w700,
          ),
          onPressed: () {
            (widget.orderModel.status == "Belum Bayar")
                ? print("Bayar Bro")
                : (widget.orderModel.status == "Dikemas")
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShippingCode(orderModel: widget.orderModel),
                        ),
                      )
                    : (widget.orderModel.status == "Dikirim")
                        ? print("Terima Lur")
                        : print("Terima Kasih");
          },
        ),
      ),
    );
  }
}
