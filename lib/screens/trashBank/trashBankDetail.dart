import 'package:flutter/material.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/screens/transporTrash/orderTrash.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/widgets/trashReceiveLisTile.dart';

class TrashBankDetail extends StatelessWidget {
  final PartnerModel partner;
  TrashBankDetail({this.partner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 120.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              color: const Color(0xffffffff),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'BS. ${partner.name}',
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
                            partner.address,
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
                    thickness: 1.0,
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
                  TrashReceiveLisTile(partner: partner),
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
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
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
        ));
  }
}
