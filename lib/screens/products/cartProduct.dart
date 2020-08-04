import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

// Widget
import 'package:lingkung/widgets/cartProductLisTile.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: CustomText(
          text: 'Keranjang',
          color: black,
          size: 18.0,
          weight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CartProductLisTile(),
          CartProductLisTile(),
          CartProductLisTile(),
        ],
      ),
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
                CustomText(
                    text: "Total Harga", size: 16.0, weight: FontWeight.w600),
                CustomText(
                  text: "Rp 34.900", color: Colors.red,
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
    // Container(
    //   height: 220.0,
    //   color: white,
    //   padding: EdgeInsets.all(16.0),
    //   child: Row(
    //     children: <Widget>[
    //       Column(
    //         children: <Widget>[
    //           Text(
    //             "Total Keuntungan",
    //             style: TextStyle(
    //                 color: Color(0xFF9BA7C6),
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           Text(
    //             "Rp 34.900",
    //             style: TextStyle(
    //                 color: Color(0xFF6C6D6D),
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 20.0,
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
    //         },
    //         child: Container(
    //           height: 50.0,
    //           decoration: BoxDecoration(
    //             color: green,
    //             borderRadius: BorderRadius.circular(20.0),
    //           ),
    //           child: Center(
    //             child: Text(
    //               "Beli",
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20.0,
    //       ),
    //     ],
    //   ),
    // );
  }
}
