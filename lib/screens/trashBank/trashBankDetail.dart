import 'package:flutter/material.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';
import 'package:lingkung/screens/transporTrash/orderTrash.dart';

class TrashBankDetail extends StatelessWidget {
  // final String bsid;
  // TrashBankDetail(this.bsid);
  final PartnerModel partner;
  TrashBankDetail({this.partner});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 24.0),
          child: Image.asset("assets/images/trashbank/bs_inyong.jpg"),
        ),
        //BG Grass
        Row(
          children: <Widget>[
            Transform.translate(
              offset: Offset(-14.23, 36.85),
              child:
                  // Adobe XD layer: 'grass1' (shape)
                  Container(
                width: 118.0,
                height: 115.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grass1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(180, -20.93),
              child:
                  // Adobe XD layer: 'grass2' (shape)
                  Container(
                width: 133.0,
                height: 149.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grass2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
        //ListView Vertical
        ListView(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              leading: Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrashBankList(),
                        ));
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 120.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: const Color(0xffffffff),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        partner.name,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Container(child: Icon(Icons.location_on)),
                        SizedBox(width: 5.0),
                        Container(
                          child: Flexible(
                            child: Text(
                              'Jalan Mocc Besar Gang Remaja RT/RW 01/02 Desa Kutasari, Kecamatan Baturraden, Kabupaten Banyumas',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Text(
                        'Jam Operasional',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      child: Text(
                        'Setiap Hari pukul 06.00 - 21.00',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      color: const Color(0xff9e9e9e),
                      thickness: 2.0,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Text(
                        'Terima Jenis Sampah',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Image.asset("assets/images/user.png")
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Botol Plastik',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Rp 4000/Kg',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Color(0xff5bc0eb),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Pilih',
                                  style:
                                      TextStyle(color: const Color(0xffffffff), fontFamily: "Poppins", fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Image.asset("assets/images/user.png")
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Kertas',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Rp 8000/Kg',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Color(0xff5bc0eb),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Pilih',
                                  style:
                                      TextStyle(color: const Color(0xffffffff), fontFamily: "Poppins", fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Image.asset("assets/images/user.png")
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Alumunium',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Rp 2000/Kg',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Color(0xff5bc0eb),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Pilih',
                                  style:
                                      TextStyle(color: const Color(0xffffffff), fontFamily: "Poppins", fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Image.asset("assets/images/user.png")
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Plastik',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Rp 1000/Kg',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Color(0xff5bc0eb),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  'Pilih',
                                  style:
                                      TextStyle(color: const Color(0xffffffff), fontFamily: "Poppins", fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 45.0,
                      child: RaisedButton(
                        color: Color(0xff9bc53d),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'LANJUT',
                            style:
                                TextStyle(color: const Color(0xffffffff), fontFamily: "Poppins", fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderTrash(),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        //ListView Vertical
      ]),
    );
  }
}
