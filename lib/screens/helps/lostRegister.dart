import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class LostRegister extends StatelessWidget {
  final data1 = [
    'Alamat email dan nomor handphone yang kamu masukkan **belum pernah terdaftar di aplikasi Lingkung**',
    'Kalau email dan nomor handphone kamu sudah terdaftar, tinggal pilih "*MASUK*" untuk login',
    'Pastikan kamu sudah mengikuti langkah-langkah mendaftarkan akun Lingkung [disini]()',
    'Jika kamu belum menerima kode verifikasi (kode OTP), klik [disini]()'
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
            text: 'Tidak bisa membuat akun Lingkung',
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
                  text: 'Silakan hubungi kami dengan menekan tombol telepon* dibawah ini dan dengan seang hati kami akan membantu kamu :)'),
              SizedBox(height: 5.0),
              Container(height: 235.0, child: Markdown(data: _markDownData1)),
              SizedBox(height: 10.0),
              CustomText(
                  text: 'Masih belum berhasil?', weight: FontWeight.w700),
              SizedBox(height: 10.0),
              CustomText(
                  text: 'Silakan hubungi kami dengan menekan tombol telepon* dibawah ini dan dengan seang hati kami akan membantu kamu :)'),
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
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                      text: 'TELEPON KAMI',
                      color: green,
                      weight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
