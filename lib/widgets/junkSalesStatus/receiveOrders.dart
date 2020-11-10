import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/providers/courierProvider.dart';
import 'package:lingkung/providers/junkSalesProvider.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/junkSalesStatus/detailOrders.dart';
import 'package:provider/provider.dart';

class ReceiveOrders extends StatefulWidget {
  final String junkSalesId;
  ReceiveOrders({this.junkSalesId});
  @override
  _ReceiveOrdersState createState() => _ReceiveOrdersState();
}

class _ReceiveOrdersState extends State<ReceiveOrders> {
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
          icon: Icon(CupertinoIcons.chevron_down),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset('assets/images/otentikasi.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 300),
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              right: 10.0,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.solidCircle,
                              size: 10.0,
                              color: green,
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Menuju ke tempatmu\n',
                                    style: TextStyle(
                                      color: black,
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Scavanger ditemukan! Tunggu kedatangan scavanger ditempatmu ya...',
                                        // ? 'Scavanger ditemukan! Sampahmu akan segera diambil oleh Scavanger...',
                                    style: TextStyle(
                                      color: black,
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CachedNetworkImage(
                            imageUrl:
                                courierProvider.courierModel?.image.toString(),
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
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
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
                        Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          height: 0,
                        ),
                        ButtonBar(
                          mainAxisSize: MainAxisSize.max,
                          alignment: MainAxisAlignment.spaceAround,
                          buttonPadding: const EdgeInsets.only(left: 10.0),
                          children: <Widget>[
                            IconButton(
                              icon: Icon(CupertinoIcons.phone),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(CupertinoIcons.chat_bubble_2),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: (partnerProvider
                                                .partnerModel?.businessName ==
                                            null)
                                        ? 'Loading...'
                                        : 'BS. ${partnerProvider.partnerModel?.businessName}',
                                    size: 16.0,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(text: 'Total Keuntungan'),
                                      CustomText(
                                        text: NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp',
                                                decimalDigits: 0)
                                            .format(junkSalesProvider
                                                .junkSalesModel.profitEstimate),
                                        weight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  dense: true,
                                  leading: CustomText(
                                    text: NumberFormat.currency(
                                                locale: 'id',
                                                symbol: '',
                                                decimalDigits: 0)
                                            .format(junkSalesProvider
                                                .listTrash[0].weight) +
                                        ' Kg',
                                    weight: FontWeight.w500,
                                  ),
                                  title: CustomText(
                                    text:
                                        '${junkSalesProvider.listTrash[0].name}',
                                  ),
                                  trailing: CustomText(
                                    text: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(
                                            junkSalesProvider.listTrash[0].price),
                                  ),
                                ),
                                Divider(
                                  indent: 16.0,
                                  endIndent: 16.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 8.0,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrders(junkSalesId: widget.junkSalesId,),),);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CustomText(
                                          text: 'Lihat Detailnya',
                                          color: blue,
                                          weight: FontWeight.w700,
                                        ),
                                        Icon(Icons.chevron_right_rounded)
                                      ],
                                    ),
                                  ),
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
                  Container(
                          height: 48.0,
                          margin: const EdgeInsets.only(top: 16.0),
                          child: FlatButton(
                            color: grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Batalkan Pesanan',
                                size: 16.0,
                                color: white,
                                weight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
