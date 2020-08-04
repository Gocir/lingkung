import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class CartProductLisTile extends StatefulWidget {
  _CartProductLisTileState createState() => _CartProductLisTileState();
}

class _CartProductLisTileState extends State<CartProductLisTile> {
  bool _isChecked = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Checkbox(
              value: _isChecked,
              onChanged: (bool value) {
                setState(() {
                  _isChecked = value;
                });
              },
              activeColor: blue,
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/noimage.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 3.0),
                      ]),
                ),
              ],
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    text: "Botol Plastik apa saja yang merusak lingkunganmu",
                    line: 2,
                    over: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(
                    text: "Rp 3000",
                    color: Colors.red,
                    size: 16.0,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      InkWell(
                          onTap: () {
                            if (_quantity != 1) {
                              setState(() {
                                _quantity -= 1;
                              });
                            }
                          },
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: yellow, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Icon(Icons.remove,
                                  color: Colors.grey, size: 14.0))),
                      SizedBox(width: 10.0),
                      CustomText(text: '$_quantity'),
                      SizedBox(width: 10.0),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _quantity += 1;
                            });
                          },
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Icon(Icons.add,
                                  color: Colors.grey, size: 14.0))),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
