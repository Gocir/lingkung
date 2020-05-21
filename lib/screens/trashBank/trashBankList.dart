import 'package:flutter/material.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/screens/transporTrash/transporTrash.dart';
import 'package:lingkung/screens/trashBank/trashBankDetail.dart';

class TrashBankList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5bc0eb),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => MainPage(),
      //           ));
      //     },
      //   ),
      //   title: Text(
      //     'Bank Sampah',
      //     style: TextStyle(
      //       fontFamily: "Poppins",
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      // extendBodyBehindAppBar: true,
      body: Stack(children: <Widget>[
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
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ));
                },
              ),
              title: Text(
                'Bank Sampah',
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: const Color(0xffffffff),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashBankDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/images/trashbank/bs_inyong.jpg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BS. Inyong',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashBankDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/images/trashbank/bs_pas.JPG"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BS. PAS',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashBankDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/images/trashbank/bs_srayanmakarya.jpeg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BS. Srayan Makarya',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashBankDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/images/trashbank/bs_cendana.jpg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BS. Cendana',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashBankDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/images/trashbank/bs_rumahkarya.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BS. Rumah Karya',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashBankDetail()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/images/trashbank/bs_malakasari.jpg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BS. Malaka Sari',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
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
          ],
        )
        //ListView Vertical
      ]),
    );
  }
}
