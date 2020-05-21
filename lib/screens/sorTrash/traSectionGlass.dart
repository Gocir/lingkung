import 'package:flutter/material.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';

class TraSectionGlass extends StatelessWidget {
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
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'Jual Sampah',
                style: TextStyle(fontFamily: "Poppins", fontSize: 12.0),
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
        margin: EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Tutup Gelas',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              child: Text(
                'Badan Gelas',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              child: Text(
                'Label Gelas',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 3)
                              ],),
                          child: Image.asset("assets/images/user.png")),
                      Text('Kecil', style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
