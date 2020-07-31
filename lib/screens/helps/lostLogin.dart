import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:lingkung/screens/helps/lostPhoNumber.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class LostLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        title: CustomText(
            text: 'Saya tidak bisa masuk', size: 18.0, weight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CustomText(
                  text:
                      'Mau masuk ke akun Lingkung tapi ada kendala terus? Atau pas mau coba masuk muncul notifikasi seperti ini?'),
              SizedBox(height: 10.0),
              CustomText(text: '"Terjadi Kesalahan"', style: FontStyle.italic),
              SizedBox(height: 5.0),
              CustomText(
                  text: '"Internal Server Error"', style: FontStyle.italic),
              SizedBox(height: 5.0),
              CustomText(
                  text: '"Tidak ada koneksi internet"',
                  style: FontStyle.italic),
              SizedBox(height: 10.0),
              CustomText(
                  text:
                      'Jika kamu ngalamin hal itu, kemungkinan kamu mengalami gangguan koneksi internet. Sebelum mencoba masuk ke akun Lingkung, silakan pastikan koneksi internet kamu berada dalam kondisi yang baik lalu coba masuk kembali.'),
              SizedBox(height: 5.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text:
                      'Pastikan juga ketika mencoba masuk ke akun Lingkung, kamu menggunakan nomor handphone dan email yang telah terdaftar di aplikasi Lingkung. Kalau nomor handphone kamu hilang atau tidak aktif dan kamu masih ingin menggunakan akun Lingkung lamamu, silakan hubungi customer services di',
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
                  text: ' 1331',
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
              Container(
                alignment: Alignment.centerLeft,
                child: CustomText(
                    text: 'Informasi yang berhubungan',
                    weight: FontWeight.w600),
              ),
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
