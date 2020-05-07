import 'package:flutter/material.dart';

class HelpRegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar',
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
        child:  Text('Hello Cak'),
      ),
    );
  }
}
