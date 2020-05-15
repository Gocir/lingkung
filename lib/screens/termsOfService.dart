import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        'Ketentuan Layanan',
        style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Center(
        child:  Text('Hello Cuk'),
      ),
    );
  }
}