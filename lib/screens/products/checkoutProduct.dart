import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class CheckoutProduct extends StatefulWidget {
  @override
  _CheckoutProductState createState() => _CheckoutProductState();
}

class _CheckoutProductState extends State<CheckoutProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: CustomText(
          text: 'Pengiriman',
          color: black,
          size: 18.0,
          weight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.location_on, size: 16.0, color: grey),
                SizedBox(width: 10),
                CustomText(
                  text: 'Alamat Pengiriman',
                ),
              ],
            ),
            Divider(),
            CustomText(
              text: 'Jl. Bumi Sani Permai Blok B7 No. 8 RT/RW 010/014, Kelurahan Setia Mekar, Kecamatan Tambun Selatan, Kabupaten Bekasi 17510', line: 3, over: TextOverflow.ellipsis, size: 10.0,
            ),
            SizedBox(height: 10.0),
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.store, color: grey),
                      CustomText(text: 'Toko Sebelah', weight: FontWeight.w600)
                    ]),
                    Divider(),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/noimage.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 2.0),
                              ]),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                text: 'Kaos kaki',
                                over: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5.0),
                              CustomText(
                                text: 'Rp 20000',
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 60.0,
      padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(3, 0), blurRadius: 3)
      ]),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(text: "Total Pembayaran"),
                CustomText(
                  text: "Rp 34.900",
                  size: 16.0,
                  color: Colors.red,
                  weight: FontWeight.w700,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: RaisedButton(
              color: green,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: CustomText(
                  text: 'Beli',
                  color: white,
                  size: 16.0,
                  weight: FontWeight.w700),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CartProduct(),
                //     ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
