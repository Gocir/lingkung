import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
//providers
import 'package:lingkung/providers/userProvider.dart';
//screens
import 'package:lingkung/screens/products/exploreProduct.dart';
import 'package:lingkung/screens/sorTrash/traSectionList.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';
//utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            //BG1
            Row(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-14.23, 36.85),
                  child:
                      // Adobe XD layer: 'grass11' (shape)
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
                  offset: Offset(180, -20.93),
                  child:
                      // Adobe XD layer: 'grass22' (shape)
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
            //BG2
            Column(
              children: <Widget>[
                //User
                Container(
                  margin: EdgeInsets.only(left: 16.0, top: 44.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: CustomText(
                                  text: 'Hai, ${user.userModel?.name}',
                                  size: 20,
                                  weight: FontWeight.w700),
                            ),
                            Container(
                              child: CustomText(
                                text: 'Pilih solusi Lingkung-mu, yuk!',
                                color: white,
                                weight: FontWeight.w600,
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
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 3),
                                    blurRadius: 3)
                              ],
                              image: DecorationImage(
                                  // image: (user.userModel?.image == null)
                                  //     ? AssetImage("assets/icons/profile.svg")
                                  //     : FileImage(File(user.userModel?.image)),
                                  image: AssetImage("assets/images/user.png"),
                                  fit: BoxFit.cover),
                            ),
                          ))
                    ],
                  ),
                ),
                //Container White
                Container(
                  margin: EdgeInsets.only(top: 86.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 86.0),
                      //Fitur
                      CustomText(text: 'Fitur utama', weight: FontWeight.w700),
                      SizedBox(height: 5.0),
                      Row(
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
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
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
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
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
                                        builder: (context) => TrashBankList()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(30),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 0),
                                        blurRadius: 6)
                                  ],
                                ),
                                child:
                                    SvgPicture.asset("assets/icons/bank.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      //Product
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                              text: 'Beli produk ramah Lingkung',
                              weight: FontWeight.w700),
                          SizedBox(height: 5.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ExploreProductPage()));
                            },
                            child: CustomText(
                                text: 'Lihat lainnya', size: 12, color: green),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        height: 185.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(width: 16.0),
                            Container(
                                width: 140.0,
                                height: 180.0,
                                margin: EdgeInsets.only(
                                    left: 2.0, top: 2.5, bottom: 2.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
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
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 3)
                                ],
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/bohlilin.png"),
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
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 3)
                                ],
                                image: DecorationImage(
                                  image: AssetImage("assets/images/tumblr.png"),
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
                            SizedBox(width: 16.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      //Konten
                      CustomText(
                          text: 'Konten untukmu', weight: FontWeight.w700),
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
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
                      SizedBox(height: 10.0),
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/images/fightcorona.png"),
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
                //Container White
              ],
            ),
            //BG3
            Container(
              height: 140.0,
              margin: EdgeInsets.only(left: 16.0, top: 120.0, right: 16.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 6)
                ],
              ),
              // child: Container(child: CustomText(text: 'Iklan',))
            )
          ],
        ),
      ),
    );
  }
}
