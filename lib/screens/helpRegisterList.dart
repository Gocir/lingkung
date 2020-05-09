import 'package:flutter/material.dart';
import 'package:lingkung/screens/howRegister.dart';

class HelpRegisterList extends StatelessWidget {

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
      body: Container(
        margin: EdgeInsets.only(left: 16.0, top:16.0, right: 16.0),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Cara membuat akun Lingkung',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.lightGreen,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HowToRegister(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Saya tidak bisa membuat',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.lightGreen,
                ),
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Saya belum menerima kode OTP',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.lightGreen,
                ),
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => HowToLogin(),
                  // ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
