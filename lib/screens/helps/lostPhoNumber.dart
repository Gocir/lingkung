import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class LostPhoneNumber extends StatelessWidget {
  final testData = [
    "Nomor handphone lama di akun Lingkung",
    "Nomor handphone baru\n(*Pastikan nomor handphone baru belum pernah terdaftar*)",
    "Alamat email",
    "Alasan perubahan"
  ];

  @override
  Widget build(BuildContext context) {
    final _markDownData =
        testData.map((x) => "1. $x\n").reduce((x, y) => "$x$y");
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        title: CustomText(
            text: 'Nomor HP Saya Hilang', size: 18.0, weight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                  text:
                      'Kalau nomor handphone yang terdaftar di akun Lingkung-mu hilang atau sudah tidak aktif tapi kamu masih ingin menggunakan akun Lingkung lamamu, tenang, karna kami bisa bantu gantiin nomor handphone lama di akunmu menjadi nomor baru yang saat ini kamu pakai.'),
              SizedBox(height: 5.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Hubungi kami melalui email ke',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                  ),
                ),
                TextSpan(
                  text: ' customerservices@lingkung.com ',
                  style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'dengan melampirkan data yang diperlukan seperti:',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                  ),
                ),
              ])),
              Container(height: 135.0, child: Markdown(data: _markDownData)),
              SizedBox(height: 20.0),
              CustomText(
                  text: 'Masih memerlukan bantuan?', weight: FontWeight.w600),
              SizedBox(height: 10.0),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Authenticate()),
                    );
                  },
                  child: CustomText(
                      text: 'TELEPON KAMI',
                      color: green,
                      weight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
