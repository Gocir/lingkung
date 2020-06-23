import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/products/exploreProduct.dart';
import 'package:lingkung/screens/sorTrash/traSectionList.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: blue,
      body: Stack(
        children: <Widget>[
          //BG Grass
          Row(
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
                      image: AssetImage("assets/images/grass1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(180, -20.93),
                child:
                    // Adobe XD layer: 'grass2' (shape)
                    Container(
                  width: 133.0,
                  height: 149.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/grass2.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //ListView Vertical
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //user
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Hai, ${user.userModel?.name}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Pilih solusi Lingkung-mu, yuk!',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xffffffff)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xfff5f5f5),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 3)
                                ],
                                image: DecorationImage(
                                    // image: (user.userModel?.image == null)
                                    //     ? AssetImage("assets/icons/profile.svg")
                                    //     : FileImage(File(user.userModel?.image)),
                                    image: AssetImage("assets/images/noimage.png"),
                                    fit: BoxFit.cover),
                              ),
                            ))
                      ],
                    ),
                  ),
                  //BG Container White
                  Container(
                    margin: EdgeInsets.only(top: 95.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Container(
                        //   height: 150.0,
                        //   margin: EdgeInsets.only(left:16.0, right: 16.0),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20.0),
                        //     color: const Color(0xffffffff),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           color: const Color(0x29000000),
                        //           offset: Offset(0, 3),
                        //           blurRadius: 3)
                        //     ],
                        //   ),
                        // ),
                        //Fitur
                        Container(
                          margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                          child: Text(
                            'Fitur utama',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TraSectionList()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/icons/garbagecar.svg"),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(
                                    //   builder: (context) => TrashBankList()
                                    // ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/icons/recycles.svg"),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TrashBankList()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.width / 3.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/icons/bank.svg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Product
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                              child: Text(
                                'Beli produk ramah Lingkung',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ExploreProductPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15.0, right: 16),
                                child: Text(
                                  'Lihat lainnya',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff5bc0eb)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 185.0,
                          margin: EdgeInsets.only(left: 16.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                  width: 140.0,
                                  height: 180.0,
                                  margin: EdgeInsets.only(
                                      left: 2.0, top: 2.5, bottom: 2.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 0),
                                          blurRadius: 3)
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/bamboostraw.png",
                                        fit: BoxFit.fill,
                                      ),
                                      Text('Sedotan Bambu 2',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500)),
                                      Text('Rp 25.000'),
                                    ],
                                  )),
                              SizedBox(width: 10.0),
                              Container(
                                width: 140.0,
                                height: 180.0,
                                margin: EdgeInsets.only(top: 2.5, bottom: 2.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 3)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/bohlilin.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Container(
                                width: 140.0,
                                height: 180.0,
                                margin: EdgeInsets.only(top: 2.5, bottom: 2.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 3)
                                  ],
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/tumblr.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // child: Text(
                                //   'Tumblr 250 ml',
                                //   style: TextStyle(
                                //     fontFamily: 'Poppins',
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w500),
                                // ),
                              ),
                            ],
                          ),
                        ),
                        //Konten
                        Container(
                          margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                          child: Text(
                            'Konten untukmu',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 10.0),
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 3)
                            ],
                            image: DecorationImage(
                              alignment: Alignment.centerLeft,
                              image: AssetImage("assets/images/news.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 16.0),
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 3)
                            ],
                            image: DecorationImage(
                              alignment: Alignment.centerLeft,
                              image:
                                  AssetImage("assets/images/fightcorona.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          // child: Text(
                          //   'Langkah-langkah untuk memerangi Corona',
                          //   style: TextStyle(
                          //     fontFamily: 'Poppins',
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w500
                          //   ),
                          //   textAlign: TextAlign.right,
                          // ),
                        ),
                      ],
                    ),
                  ),
                  //BG Container White
                ],
              ),
            ],
          ),
          //ListView Vertical
        ],
      ),
    );
  }
}
