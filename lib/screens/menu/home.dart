import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingkung/screens/sorTrash/traSectionList.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';
// import 'package:lingkung/services/auth.dart';

class HomePage extends StatelessWidget {
  // final AuthService _auth = AuthService();

  final String garbagecar = 'assets/icons/garbagecar.svg';
  final String recycles = 'assets/icons/recycles.svg';
  final String bank = 'assets/icons/bank.svg';
  final ImageProvider grass2;
  final ImageProvider fightcorona;
  final ImageProvider news;
  final ImageProvider reduce;
  final ImageProvider grass1;
  final ImageProvider user;
  final ImageProvider bohlilin;
  final ImageProvider bamboostraw;
  final ImageProvider tumblr;
  HomePage({
    Key key,
    this.grass2 = const AssetImage('assets/images/grass2.png'),
    this.fightcorona = const AssetImage('assets/images/fightcorona.png'),
    this.news = const AssetImage('assets/images/news.png'),
    this.reduce = const AssetImage('assets/images/reduce.png'),
    this.grass1 = const AssetImage('assets/images/grass1.png'),
    this.user = const AssetImage('assets/images/user.png'),
    this.bohlilin = const AssetImage('assets/images/bohlilin.jpg'),
    this.bamboostraw = const AssetImage('assets/images/bamboostraw.png'),
    this.tumblr = const AssetImage('assets/images/tumblr.png'),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9bc53d),
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
                      image: grass1,
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
                      image: grass2,
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
                                  'Hai, Ridwan',
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
                                    image: user, fit: BoxFit.cover),
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
                                fontWeight: FontWeight.w700),
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
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => TraSectionList()
                                    ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.width / 3.5,
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
                                    child: SvgPicture.asset(garbagecar
                                    ),
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
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: SvgPicture.asset(recycles),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => TrashBankList()
                                    ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.width / 3.5,
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
                                    child: SvgPicture.asset(bank),
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
                              margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                              child: Text(
                                'Beli produk ramah Lingkung',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15.0, right: 16),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Lainnya',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff9e9e9e)),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.lightGreen,
                                    size: 20,
                                  ),
                                ],
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
                                    Image.asset("assets/images/bamboostraw.png"),
                                    Text('Sedotan Bambu 2 set + sikat'),
                                    Text('Rp 25.000'),
                                  ],
                                )
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
                                    image: bohlilin,
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
                                    image: tumblr,
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
                                fontWeight: FontWeight.w700),
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
                              image: news,
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
                              image: fightcorona,
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
