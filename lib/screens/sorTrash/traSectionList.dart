import 'package:flutter/material.dart';
import 'package:lingkung/screens/sorTrash/traSectionBottle.dart';
import 'package:lingkung/screens/sorTrash/traSectionGlass.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';

class TraSectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5bc0eb),
        title: Text(
          'Pilah Sampah',
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, right: 16.0, bottom: 10.0),
            height: 10.0,
            child: RaisedButton(
              color: Color(0xfffde74c),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
              child: Text(
                'Jual Sampah',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12.0
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrashBankList(),
                    ));
              },
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, top:16.0, right: 16.0),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Gelas',
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TraSectionGlass(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Botol',
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TraSectionBottle(),
                  ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Kertas',
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
                  //   builder: (context) => TraSectionBottle(),
                  // ));
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text(
                  'Buah',
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
                  //   builder: (context) => TraSectionBottle(),
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
