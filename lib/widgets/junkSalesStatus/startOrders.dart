import 'package:flutter/material.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/providers/junkSalesProvider.dart';
import 'package:lingkung/services/junkSalesService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class StartOrders extends StatefulWidget {
  final String junkSalesId;
  StartOrders({this.junkSalesId});
  @override
  _StartOrdersState createState() => _StartOrdersState();
}

class _StartOrdersState extends State<StartOrders> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  JunkSalesServices _junkSalesService = JunkSalesServices();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final junkSalesProvider = Provider.of<JunkSalesProvider>(context);
    // final courierProvider = Provider.of<CourierProvider>(context);
    // final partnerProvider = Provider.of<PartnerProvider>(context);
    // junkSalesProvider.loadSingleJunkSales(widget.junkSalesId);
    // junkSalesProvider.loadListTrash(widget.junkSalesId);
    // courierProvider.loadSingleCourier(junkSalesProvider.junkSalesModel.courierId);
    // partnerProvider.loadSinglePartner(junkSalesProvider.junkSalesModel.partnerId);
    return Scaffold(
      key: _scaffoldStateKey,
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/verifailed.png'),
            CustomText(
              text:
                  'Mohon tunggu sebentar. Kami sedang mencari Scavanger untukmu...',
                  align: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        padding: const EdgeInsets.all(16.0),
        child: FlatButton(
          color: green,
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
          onPressed: () {
            _deleteBottomSheet(context);
          },
        ),
      ),
    );
  }

  void delete() async {
    final salesProvider = Provider.of<JunkSalesProvider>(
      context,
      listen: false,
    );
    salesProvider.loadSingleJunkSales(widget.junkSalesId);
    salesProvider.loadListTrash(widget.junkSalesId);
    setState(() {
      loading = true;
    });

    for (int i = 0; i < salesProvider.listTrash.length; i++) {
      await _junkSalesService.deleteListTrash(
          junkSalesId: widget.junkSalesId,
          trashItemId: salesProvider.listTrash[i].id);
    }
    print("LIST TRASH '${salesProvider.listTrash.toString()}' WAS DELETED");

    await salesProvider.deleteJunkSales(junkSalesId: widget.junkSalesId);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );
    setState(() {
      loading = false;
    });
  }

  void _deleteBottomSheet(context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 2.2,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/verifailed.png"),
                  ),
                  SizedBox(height: 16.0),
                  CustomText(
                    text: 'Yahh! Kamu yakin ingin membatalkan pesanan ini?',
                    size: 18.0,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 48,
                          child: OutlineButton(
                            color: green,
                            highlightedBorderColor: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            borderSide: BorderSide(
                              color: green,
                              width: 2.5,
                            ),
                            child: CustomText(
                              text: 'TIDAK',
                              color: green,
                              size: 16.0,
                              weight: FontWeight.w700,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Container(
                          height: 48,
                          child: FlatButton(
                            color: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CustomText(
                              text: 'YA',
                              color: white,
                              size: 16.0,
                              weight: FontWeight.w700,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              delete();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
