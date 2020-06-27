import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/myAccount.dart';
import 'package:lingkung/widgets/myStore.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndexValue = 0;

  void onValueChanged(int newValue) {
    setState(() {
      _selectedIndexValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    final _children = <int, Widget>{
      0: CustomText(
          text: 'Akun Saya', color: _selectedIndexValue == 1 ? black : white),
      1: CustomText(
          text: 'Toko Saya', color: _selectedIndexValue == 0 ? black : white),
    };

    return Scaffold(
      backgroundColor: blue,
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          //BG1
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
                      image: AssetImage("assets/images/grass11.png"),
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
                      image: AssetImage("assets/images/grass22.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //BG2
          Column(
            children: <Widget>[
              //User
              Container(
                margin: EdgeInsets.only(left: 16.0, top: 44.0, right: 16.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  blurRadius: 3)
                            ],
                            image: DecorationImage(
                                image: AssetImage("assets/images/user.png"),
                                fit: BoxFit.cover),
                          ),
                        )),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${user.userModel?.name}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Text(
                            '${user.userModel?.email}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Container White
              Container(
                margin: EdgeInsets.only(top: 66.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50.666),
                    Center(
                      child: CupertinoSlidingSegmentedControl(
                          thumbColor: green,
                          groupValue: _selectedIndexValue,
                          children: _children,
                          onValueChanged: onValueChanged),
                    ),
                    SizedBox(height: 16.0),
                    _selectedIndexValue == 0 ? MyAccount() : MyStore()
                  ],
                ),
              ),
              //Container White
            ],
          ),
          //BG3
          Container(
            height: 100.0,
            margin: EdgeInsets.only(left: 16.0, top: 120.0, right: 16.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 0), blurRadius: 6)
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset("assets/icons/balanceColor.png"),
                      CustomText(text: 'Saldo'),
                      CustomText(
                        text: '0',
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset("assets/icons/pointColor.png"),
                      CustomText(text: 'Poin'),
                      CustomText(
                        text: '0',
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset("assets/icons/weightColor.png"),
                      CustomText(text: 'Sampah'),
                      CustomText(
                        text: '0',
                        weight: FontWeight.w600,
                      )
                    ],
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
