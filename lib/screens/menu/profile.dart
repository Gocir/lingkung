import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingkung/models/user.dart';
import 'package:lingkung/screens/contactUs.dart';
import 'package:lingkung/screens/helps/helpFeatureList.dart';
import 'package:lingkung/screens/privacyPolicy.dart';
import 'package:lingkung/screens/termsOfService.dart';
import 'package:lingkung/services/auth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final FirebaseUser user;

  ProfilePage({Key key, this.user}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: const Color(0xff9bc53d),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //user
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 44.0, right: 16.0),
              child: Row(
                children: <Widget>[
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
                              image: AssetImage("assets/images/user.png"),
                              fit: BoxFit.cover),
                        ),
                      )),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${user?.name}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${user?.email}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffffffff)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //BG Container White
            Container(
              margin: EdgeInsets.only(top: 50.0),
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
                  //Konten
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 5.0),
                    child: Text(
                      'Akun',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 16.0, right: 16.0),
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
                      child: Column(
                        children: ListTile.divideTiles(
                            context: context,
                            tiles: [
                              ListTile(
                                leading: SvgPicture.asset("assets/icons/editprofil.svg"),
                                title: Text(
                                  'Edit Profil',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xff9bc53d),
                                ),
                                dense: true,
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) => TraSectionGlass(),
                                  // ));
                                },
                              ),
                              ListTile(
                                leading: SvgPicture.asset("assets/icons/helps.svg"),
                                title: Text(
                                  'Bantuan',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xff9bc53d),
                                ),
                                dense: true,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => HelpFeatureList(),
                                  ));
                                },
                              ),
                              ListTile(
                                leading: SvgPicture.asset("assets/icons/contact.svg"),
                                title: Text(
                                  'Hubuni Kami',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xff9bc53d),
                                ),
                                dense: true,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ContactUs(),
                                  ));
                                },
                              ),
                            ],
                          ).toList(),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 5.0),
                    child: Text(
                      'Info lainnya',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 16.0, right: 16.0),
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
                      child: Column(
                        children: ListTile.divideTiles(
                            context: context,
                            tiles: [
                              ListTile(
                                leading: SvgPicture.asset("assets/icons/tos.svg"),
                                title: Text(
                                  'Ketentuan Layanan',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xff9bc53d),
                                ),
                                dense: true,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => TermsOfService(),
                                  ));
                                },
                              ),
                              ListTile(
                                leading: SvgPicture.asset("assets/icons/privacy.svg"),
                                title: Text(
                                  'Kebijakan Privacy',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xff9bc53d),
                                ),
                                dense: true,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PrivacyPolicy(),
                                  ));
                                },
                              ),
                              ListTile(
                                leading: SvgPicture.asset("assets/icons/phone.svg"),
                                title: Text(
                                  'Versi',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Text(
                                  "1.1.1",
                                  style: TextStyle(fontFamily: "Poppins", fontSize: 12, color: const Color(0xfffde74c))
                                ),
                                dense: true,
                              ),
                            ],
                          ).toList(),
                      )),
                  Container(
                    height: 45.0,
                    margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                    child: RaisedButton(
                      color: Color(0xff9bc53d),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'KELUAR',
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () async {
                        await _auth.logout();
                      },
                    ),
                  ),
                ],
              ),
            ),
            //BG Container White
          ],
        ),
        //ListView Vertical
        Container(
          height: 120.0,
          margin: EdgeInsets.only(left: 16.0, top: 120.0, right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 0),
                  blurRadius: 6)
            ],
          ),
        )
      ]),
    );
  }
}
