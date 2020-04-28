import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {

  final pageDecoration = PageDecoration(
    titleTextStyle:PageDecoration().titleTextStyle.copyWith(
      color: Colors.lightGreen,
      fontFamily: 'Roboto',
      fontSize: 40.0),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(
      color: Colors.grey,
      fontFamily: 'Poppins',
      fontSize: 16.0),
    contentPadding: const EdgeInsets.all(30),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/reduce.png"),
        title: "REDUCE",
        body: "Mengurangi penggunaan barang dengan material sekali pakai dan dapat merusak lingkungan.",
        decoration: pageDecoration
      ),
      PageViewModel(
        image: Image.asset("assets/images/reduce.png"),
        title: "REUSE",
        body: "Menggunakan kembali barang atau material sisa yang masih bisa dan aman untuk dipakai, dengan fungsi yang lain.",
        decoration: pageDecoration
      ),
      PageViewModel(
        image: Image.asset("assets/images/reduce.png"),
        title: "RECYCLE",
        body: "Mendaur ulang atau Mengolah barang tidak terpakai (sampah) menjadi barang yang bermanfaat dan bahkan memiliki nilai jual.",
        decoration: pageDecoration
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getPages(),
        onDone: () {
        },
        next: const Text(
          'LANJUT',
          style: TextStyle(
            color: Colors.lightGreen,
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.bold),
        ),
        done: RaisedButton(
          color: Colors.lightGreen[700],
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          child: Text(
            'MULAI',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(12.0, 12.0),
          activeColor: Colors.lightGreen,
          color: Colors.lightGreen[100],
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        ),
      ),
    );
  }
}