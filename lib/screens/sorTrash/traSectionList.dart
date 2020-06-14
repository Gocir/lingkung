import 'package:flutter/material.dart';
import 'package:lingkung/screens/sorTrash/traSectionBottle.dart';
import 'package:lingkung/screens/sorTrash/traSectionGlass.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';
import 'package:lingkung/utilities/colorStyle.dart';
// import 'package:lingkung/widgets/categoryTrash.dart';
import 'package:lingkung/utilities/textStyle.dart';

class TraSectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: CustomText(
          text: 'Pilah Sampah',
          color: white,
          size: 20,
          weight: FontWeight.w600,
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, right: 16.0, bottom: 10.0),
            height: 10.0,
            child: RaisedButton(
              color: yellow,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
              child: CustomText(
                text: 'Jual Sampah',
                size: 12.0,
                weight: FontWeight.w500,
              ),
              onPressed: () {
                Navigator.push(
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
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Categories(),
            // SizedBox(height: 16.0),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: 'Gelas',
                  size: 14.0,
                  weight: FontWeight.w700
                  ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: green,
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
