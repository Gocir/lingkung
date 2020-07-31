import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class HelpFeatureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        title: CustomText(
          text: 'Bantuan',
          color: black,
          size: 18.0,
          weight: FontWeight.w600,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Cara Jual Sampah',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Saya tidak tahu Jenis Sampah',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Saya tidak bisa menjual sampah',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Cara beli produk',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Saya tidak bisa merubah profil',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Saya tidak bisa membeli produk',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
