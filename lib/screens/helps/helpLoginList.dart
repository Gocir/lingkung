import 'package:flutter/material.dart';
import 'package:lingkung/screens/helps/howLogin.dart';
import 'package:lingkung/screens/helps/lostOTP.dart';
import 'package:lingkung/screens/helps/lostPhoNumber.dart';
import 'package:lingkung/screens/helps/lostLogin.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class HelpLoginList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: blue,
        iconTheme: IconThemeData(
          color: white
        ),
        title: CustomText(
          text: 'Masuk',
          size: 18.0,
          color: white,
          weight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Cara masuk ke akun Lingkung',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HowToLogin(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Saya tidak bisa masuk',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LostLogin(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Saya belum menerima kode OTP',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LostOTPCode(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Nomor ponsel saya hilang',
                  weight: FontWeight.w700
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: yellow,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LostPhoneNumber(),
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
