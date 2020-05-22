import 'package:flutter/material.dart';

class HelpFeatureList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bantuan',
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
                  'Cara Jual Sampah',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
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
                  'Saya tidak tahu Jenis Sampah',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
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
                  'Saya tidak bisa menjual sampah',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
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
                  'Cara beli produk',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
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
                  'Saya tidak bisa merubah profil',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
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
                  'Saya tidak bisa membeli produk',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
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
