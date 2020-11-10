import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/informations/textInfoNews.dart';
import 'package:lingkung/widgets/informations/textInfoTutorial.dart';
import 'package:lingkung/widgets/informations/videoInfoNews.dart';
import 'package:lingkung/widgets/informations/videoInfoTutorial.dart';
// Widgets

class InformationsPage extends StatefulWidget {
  @override
  _InformationsPageState createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  int _selectedIndexValue = 0;

  void onValueChanged(int newValue) {
    setState(() {
      _selectedIndexValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _type = <int, Widget>{
      0: Padding(
        padding: EdgeInsets.all(6.0),
        child: CustomText(
          text: 'Teks', color: (_selectedIndexValue == 0) ? white : black.withOpacity(0.5))),
      1: Padding(
        padding: EdgeInsets.all(6.0),
        child: CustomText(
          text: 'Video', color: (_selectedIndexValue == 1) ? white : black.withOpacity(0.5))),
    };

    final _kInfoTabs = <Tab> [
      Tab(text: 'Berita'),
      Tab(text: 'Tutorial'),
    ];
    
    final _kInfoTextPages = <Widget> [
      TextInfoNewsList(),
      TextInfoTutoriaList(),
    ];

    final _kInfoVideoPages = <Widget> [
      VideoInfoNewsList(),
      VideoInfoTutoriaList(),
    ];

    return DefaultTabController(
        length: _kInfoTabs.length,
        child: SafeArea(
                  child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            iconTheme: IconThemeData(color: black),
            centerTitle: true,
            title: CustomText(
              text: 'Informasi Lingkung',
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
                      children: _type,
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
                    tabs: _kInfoTabs)
                ],
              )),
              flexibleSpace: Row(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(-14.23, 12.85),
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
                    offset: Offset(150, -44.93),
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
          body: (_selectedIndexValue == 0) ? TabBarView(children: _kInfoTextPages) : TabBarView(children: _kInfoVideoPages)
      ),
        ),
    );
  }
}
