import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Firebase
import 'package:firebase_storage/firebase_storage.dart';
// Providers
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/history/finisHistoryProduct.dart';
import 'package:lingkung/widgets/history/notYetPaidHistoryProduct.dart';
// Widgets
import 'package:lingkung/widgets/history/packedHistoryProduct.dart';
import 'package:lingkung/widgets/history/sentHistoryProduct.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  int _selectedIndexValue = 0;

  void onValueChanged(int newValue) {
    setState(() {
      _selectedIndexValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _history = <int, Widget>{
      0: Padding(
        padding: EdgeInsets.all(6.0),
        child: CustomText(
          text: 'Sampah', color: (_selectedIndexValue == 0) ? white : black.withOpacity(0.5))),
      1: Padding(
        padding: EdgeInsets.all(6.0),
        child: CustomText(
          text: 'Produk', color: (_selectedIndexValue == 1) ? white : black.withOpacity(0.5))),
    };
    
    final _kProducTabs = <Tab> [
      Tab(text: 'Belum Bayar'),
      Tab(text: 'Dikemas'),
      Tab(text: 'Dikirim'),
      Tab(text: 'Selesai'),
    ];
    
    final _kTrashTabs = <Tab> [
      Tab(text: 'Dalam Proses'),
      Tab(text: 'Selesai'),
    ];

    final _kProductPages = <Widget> [
      NotYetPaidHistoryProduct(),
      PackedHistoryProduct(),
      SentHistoryProduct(),
      FinishHistoryProduct()
    ];

    final _kTrashPages = <Widget> [
      Center(child: Icon(Icons.timer)),
      Center(child: Icon(Icons.check_circle_outline)),
    ];

    return DefaultTabController(
        length: (_selectedIndexValue == 0) ? _kTrashTabs.length : _kProducTabs.length,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          centerTitle: true,
          title: CustomText(
            text: 'Riwayat Pesanan',
            size: 18.0,
            weight: FontWeight.w600,
          ),
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CupertinoSlidingSegmentedControl(
                    children: _history,
                    thumbColor: green,
                    groupValue: _selectedIndexValue,
                    onValueChanged: onValueChanged),
                ),
                TabBar(
                  indicatorColor: yellow,
                  labelColor: yellow,
                  labelStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500),
                  unselectedLabelColor: white.withOpacity(0.8),
                  unselectedLabelStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.normal),
                  isScrollable: (_selectedIndexValue == 0) ? false : true,
                  tabs: (_selectedIndexValue == 0) ? _kTrashTabs : _kProducTabs)
              ],
            )),
            flexibleSpace: Row(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-14.23, 36.85),
                  child:
                      // Adobe XD layer: 'grass1' (shape)
                      Container(
                    width: 118.0,
                    height: 115.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/grass11.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(150, -20.93),
                  child:
                      // Adobe XD layer: 'grass2' (shape)
                      Container(
                    width: 133.0,
                    height: 149.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/grass22.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
        body: (_selectedIndexValue == 0) ? TabBarView(children: _kTrashPages) : TabBarView(children: _kProductPages)
      ),
    );
  }
}
