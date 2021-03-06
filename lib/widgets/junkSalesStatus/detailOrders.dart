import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/providers/courierProvider.dart';
import 'package:lingkung/providers/junkSalesProvider.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class DetailOrders extends StatefulWidget {
  final String junkSalesId;
  DetailOrders({this.junkSalesId});
  @override
  _DetailOrdersState createState() => _DetailOrdersState();
}

class _DetailOrdersState extends State<DetailOrders> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final junkSalesProvider = Provider.of<JunkSalesProvider>(context);
    final courierProvider = Provider.of<CourierProvider>(context);
    final partnerProvider = Provider.of<PartnerProvider>(context);
    junkSalesProvider.loadSingleJunkSales(widget.junkSalesId);
    junkSalesProvider.loadListTrash(widget.junkSalesId);
    courierProvider
        .loadSingleCourier(junkSalesProvider.junkSalesModel.courierId);
    partnerProvider
        .loadSinglePartner(junkSalesProvider.junkSalesModel.partnerId);
    return Scaffold(
      key: _scaffoldStateKey,
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 2.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomText(
          text: 'Rincian Pesanan',
          size: 18.0,
          weight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: courierProvider.courierModel?.image.toString(),
                      imageBuilder: (_, imageProvider) =>
                          CircleAvatar(backgroundImage: imageProvider),
                      placeholder: (_, url) => CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: SpinKitThreeBounce(
                          color: black,
                          size: 10.0,
                        ),
                      ),
                      errorWidget: (_, url, error) => CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                    ),
                    title: CustomText(
                      text: (courierProvider.courierModel?.courierName == null)
                          ? 'Loading...'
                          : '${courierProvider.courierModel?.courierName}',
                      size: 16.0,
                      weight: FontWeight.w700,
                    ),
                    subtitle: CustomText(
                      text: 'Tosa',
                      size: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Icon(
                            Icons.home_filled,
                            size: 16.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: CustomText(
                            text:
                                '${junkSalesProvider.junkSalesModel.directionModel.startPoint}',
                            line: 2,
                            over: TextOverflow.ellipsis,
                            size: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.5),
                      child: CustomText(
                        text: ':',
                        color: grey,
                        size: 16.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_pin, color: Colors.red),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: CustomText(
                            text:
                                '${junkSalesProvider.junkSalesModel.directionModel.destination}',
                            line: 2,
                            over: TextOverflow.ellipsis,
                            size: 12.0,
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: 'Rincian Sampah',
                      weight: FontWeight.w600,
                    ),
                    Divider(),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: junkSalesProvider.listTrash.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          dense: true,
                          leading: CustomText(
                            text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: '',
                                        decimalDigits: 0)
                                    .format(junkSalesProvider
                                        .listTrash[index].weight) +
                                ' Kg',
                            weight: FontWeight.w500,
                          ),
                          title: CustomText(
                            text: '${junkSalesProvider.listTrash[index].name}',
                          ),
                          trailing: CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(
                                    junkSalesProvider.listTrash[index].price),
                          ),
                        );
                      },
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Keuntungan (estimasi)",
                          size: 12.0,
                        ),
                        CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(junkSalesProvider
                                    .junkSalesModel.profitEstimate),
                            size: 12.0),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Untuk Bumi",
                          size: 12.0,
                        ),
                        CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(junkSalesProvider.junkSalesModel.earth),
                            size: 12.0),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Jasa Pengantaran",
                          size: 12.0,
                        ),
                        CustomText(
                          text: NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp', decimalDigits: 0)
                              .format(junkSalesProvider
                                  .junkSalesModel.deliveryCosts),
                          size: 12.0,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Total Keuntungan'),
                        CustomText(
                          text: NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp', decimalDigits: 0)
                              .format(junkSalesProvider
                                  .junkSalesModel.profitEstimate),
                          size: 16.0,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    CustomText(
                      text: 'Metode Pembayaran',
                      weight: FontWeight.w600,
                    ),
                    Spacer(),
                    Image.asset("assets/icons/balanceColor.png"),
                    SizedBox(width: 10.0),
                    CustomText(
                      text: 'Tunai',
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
