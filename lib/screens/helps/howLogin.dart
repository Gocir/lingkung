import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:lingkung/screens/helps/lostOTP.dart';
import 'package:lingkung/screens/helps/lostPhoNumber.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class HowToLogin extends StatelessWidget {
  final data1 = [
    'Buka aplikasi Lingkung',
    'Masukkan nomor handphone kamu *yang sudah terdaftar, lalu pilih "**Masuk**"',
  ];
  final data2 = [
    'Pastikan koneksi internet kamu bagus agar kamu bisa menerima kode verifikasi (OTP) lewat SMS pada nomor handphone yang sudah terdaftar. **Jangan bagikan kode tersebut ke siapapun termasuk Lingkung**',
    'Masukkan kode veridikasi di kolom yang tersedia di aplikasi Lingkung, lalu tekan tombol "**Konfirmasi**".',
  ];

  @override
  Widget build(BuildContext context) {
    final _markDownData1 = data1.map((x) => "- $x\n").reduce((x, y) => "$x$y");
    final _markDownData2 = data2.map((x) => "- $x\n").reduce((x, y) => "$x$y");
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        titleSpacing: 0,
        title: CustomText(
            text: 'Cara masuk ke akun Lingkung',
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
                      'Sudah punya akun Lingkung? Yuk masuk ke akun Linkung buat nikmatin semua layanannya, ikuti langkah berikut:'),
              SizedBox(height: 5.0),
              Container(height: 90.0, child: Markdown(data: _markDownData1)),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/auth.png")),
              SizedBox(height: 5.0),
              Container(height: 170.0, child: Markdown(data: _markDownData2)),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/verif.png")),
              SizedBox(height: 5.0),
              Container(
                  height: 65.0,
                  child: Markdown(
                      data:
                          '* Hore! kamu sudah berhasil masuk ke akun Lingkung kamu.')),
              SizedBox(height: 5.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text:
                      '*Jika nomor handphone kamu yang terdaftar pada akun Lingkung kamu hilang, cek apa yang harus kamu lakukan',
                  style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic),
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
                      fontStyle: FontStyle.italic,
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
              SizedBox(height: 5.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text:
                      'Kalau kamu mau masuk pakai nomor baru, kamu harus buat akun Lingkung baru terlebih dahulu. Klik',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: ' disini ',
                  style: TextStyle(
                      color: blue,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text:
                      'buat lihat caranya. Perlu diingat, bahwa kamu tidak bisa mendaftarkan akun Lingkung baru dengan nomor yang sudah terdaftar sebelumnya.',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ])),
              SizedBox(height: 5.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text:
                      'Jika masih mengalami kesulitan untuk masuk ke akun kamu, hubungi customer service di',
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                  ),
                ),
                TextSpan(
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Authenticate()),
                      );
                    },
                  text: ' 1331 ',
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
              SizedBox(height: 20.0),
              CustomText(
                  text: 'Masih memerlukan bantuan?', weight: FontWeight.w600),
              SizedBox(height: 10.0),
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
                      MaterialPageRoute(
                          builder: (context) => LostPhoneNumber()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                        text: 'NOMOR HANDPHONE SAYA HILANG/TIDAK AKTIF',
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
