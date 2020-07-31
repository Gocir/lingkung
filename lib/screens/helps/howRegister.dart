import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lingkung/screens/helps/howLogin.dart';
import 'package:lingkung/screens/helps/lostOTP.dart';
import 'package:lingkung/screens/helps/lostRegister.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class HowToRegister extends StatelessWidget {
  final data1 = [
    'Pilih tombol "**DAFTAR**". (Pilih "MASUK" jika nomor handphone-mu sudah terdaftar).',
    'Isi data yang diperlukan dengan benar, lalu klik "**Lanjut**".',
    'Masukkan kode OTP yang kamu terima melalui SMKS. Psstt... jangan beri tahu kode tersebut ke siapa pun ya termasuk pihak Lingkung!.',
    '*Yeay!* Pendaftaran berhasil.'
  ];

  @override
  Widget build(BuildContext context) {
    final _markDownData1 = data1.map((x) => "1. $x\n").reduce((x, y) => "$x$y");
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        titleSpacing: 0,
        title: CustomText(
            text: 'Cara membuat akun Lingkung',
            size: 18.0,
            weight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text:
                      'Hai, selamat datang di Lingkung! Kamu bisa membuat akun Lingkung dengan',
                  style: TextStyle(
                      color: black, fontFamily: 'Poppins', fontSize: 14.0),
                ),
                TextSpan(
                  text: ' menggunakan email dan nomor handphone-mu ',
                  style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'yang aktif. Berikut caranya:',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                  ),
                ),
              ])),
              SizedBox(height: 10.0),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/register.png")),
              SizedBox(height: 5.0),
              Container(height: 200.0, child: Markdown(data: _markDownData1)),
              SizedBox(height: 10.0),
              CustomText(
                  text: 'Masih memerlukan bantuan?', weight: FontWeight.w600),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HowToLogin()),
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                      text: 'CARA MASUK KE AKUN LINGKUNG',
                      color: green,
                      weight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 5.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LostOTPCode()),
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                      text: 'SAYA BELUM MENERIMA KODE OTP',
                      color: green,
                      weight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 5.0),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LostRegister()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                        text: 'SAYA TIDAK BISA MEMBUAT AKUN LINGKUNG',
                        color: green,
                        weight: FontWeight.w600),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
