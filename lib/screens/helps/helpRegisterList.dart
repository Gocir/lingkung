import 'package:flutter/material.dart';
import 'package:lingkung/screens/helps/howRegister.dart';
import 'package:lingkung/screens/helps/lostOTP.dart';
import 'package:lingkung/screens/helps/lostRegister.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class HelpRegisterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: blue,
        iconTheme: IconThemeData(color: white),
        title: CustomText(
          text: 'Daftar',
          size: 18.0,
          color: white,
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
                    text: 'Cara membuat akun Lingkung',
                    weight: FontWeight.w700),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HowToRegister(),
                      ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                    text: 'Saya tidak bisa membuat akun', weight: FontWeight.w700),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LostRegister(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                    text: 'Saya belum menerima kode OTP',
                    weight: FontWeight.w700),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LostOTPCode(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
