import 'package:flutter/material.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
// Widgets
import 'package:lingkung/widgets/sales/productNotYetPaid.dart';
import 'package:lingkung/widgets/sales/productFinish.dart';
import 'package:lingkung/widgets/sales/productPacked.dart';
import 'package:lingkung/widgets/sales/productSent.dart';

class SalesProductPage extends StatefulWidget {
  @override
  _SalesProductPageState createState() => _SalesProductPageState();
}

class _SalesProductPageState extends State<SalesProductPage> {
  @override
  Widget build(BuildContext context) {    
    final _kProducTabs = <Tab> [
      Tab(text: 'Belum Bayar'),
      Tab(text: 'Dikemas'),
      Tab(text: 'Dikirim'),
      Tab(text: 'Selesai'),
    ];

    final _kProductPages = <Widget> [
      ProductNotYetPaid(),
      ProductPacked(),
      ProductSent(),
      ProductFinish()
    ];
    return DefaultTabController(
        length: _kProducTabs.length,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          centerTitle: true,
          title: CustomText(
            text: 'Penjualan Saya',
            size: 18.0,
            weight: FontWeight.w600,
          ),
          bottom: TabBar(
            indicatorColor: yellow,
            labelColor: yellow,
            labelStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500),
            unselectedLabelColor: white.withOpacity(0.8),
            unselectedLabelStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.normal),
            isScrollable: true,
            tabs: _kProducTabs
            ),
            // flexibleSpace: Row(
            //   children: <Widget>[
            //     Transform.translate(
            //       offset: Offset(-14.23, 36.85),
            //       child:
            //           // Adobe XD layer: 'grass1' (shape)
            //           Container(
            //         width: 118.0,
            //         height: 115.0,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("assets/images/grass11.png"),
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Transform.translate(
            //       offset: Offset(180, -20.93),
            //       child:
            //           // Adobe XD layer: 'grass2' (shape)
            //           Container(
            //         width: 133.0,
            //         height: 149.0,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("assets/images/grass22.png"),
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
        ),
        body: TabBarView(children: _kProductPages)
      ),
    );
  }
}
