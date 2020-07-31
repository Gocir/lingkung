import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lingkung/screens/helps/lostPhoNumber.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class LostOTPCode extends StatelessWidget {
  final data1 = [
    'Pastikan **sinyal operator nomor handphone-mu** bagus agar SMS kode OTP bisa diterima',
    'Tunggu **minimal 30 detik** hingga SMS kode OTP sampai, pastikan kamu menerima kode tersebut ya',
  ];
  final data2 = [
    'Perbaharui aplikasi kamu ke versi terbaru',
    'Kalau kamu menggunakan tipe handphone Android, silakan lakukan clear cache (hapus memori) di penyimpanan-mu.',
  ];

  @override
  Widget build(BuildContext context) {
    final _markDownData1 = data1.map((x) => "- $x\n").reduce((x, y) => "$x$y");
    final _markDownData2 = data1.map((x) => "1. $x\n").reduce((x, y) => "$x$y");
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        titleSpacing: 0,
        title: CustomText(
            text: 'Belum menerima kode OTP',
            size: 18.0,
            weight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                  text:
                      'Langkah yang bisa kamu lakukan jika belum mendapatkan kode OTP lewat SMS:'),
              SizedBox(height: 5.0),
              Container(
                  height: 115.0,
                  child: Markdown(
                      data:
                          '* Pastikan kamu memasukkan nomor handphone dengan benar. Jika kamu ingin masuk (Login) ke akun Lingkung, masukkan nomor handphone **yang sudah terdaftar di Lingkung**')),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/halfLogin.png")),
              SizedBox(height: 10.0),
              CustomText(
                  text: '(Contoh ketika ingin masuk (Login) di Lingkung)',
                  style: FontStyle.italic),
              Container(height: 140.0, child: Markdown(data: _markDownData1)),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/halfVerif.png")),
              SizedBox(height: 5.0),
              Container(
                  height: 130.0,
                  child: Markdown(
                      data:
                          '* Lingkung Indonesia tidak pernah meminta kode OTP untuk alasan apapun. Jadi, jika ada pihak yang mengatasnamakan Lingkung Indonesia atau afiliasinya meminta kode OTP tersebut, mohon untuk tidak percaya dan tidak memberikannya.')),
              SizedBox(height: 5.0),
              CustomText(
                  text:
                      'Saya sudah melakukan yang disebutkan di atas, tapi tetap tidak mendapatkan sms kode OTP :(',
                  weight: FontWeight.w700),
              SizedBox(height: 10.0),
              CustomText(
                  text:
                      'Jangan sedih dulu ya, kamu bisa ikuti beberapa tips di bawah ini:'),
              SizedBox(height: 5.0),
              Container(height: 138.0, child: Markdown(data: _markDownData2)),
              SizedBox(height: 5.0),
              CustomText(
                  text: 'Bagaimana jika nomor handphone saya hilang?',
                  weight: FontWeight.w700),
              SizedBox(height: 10.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Jangan khawatir! Kamu bisa lihat caranya',
                  style: TextStyle(
                      color: black, fontFamily: 'Poppins', fontSize: 14.0),
                ),
                TextSpan(
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LostPhoneNumber()),
                      );
                    },
                  text: ' disini ',
                  style: TextStyle(
                      color: blue,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                  ),
                ),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
