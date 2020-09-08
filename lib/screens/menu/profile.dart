import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// Firebase
import 'package:firebase_storage/firebase_storage.dart';
// Providers
import 'package:lingkung/providers/userProvider.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
// Widgets
import 'package:lingkung/widgets/myAccount.dart';
import 'package:lingkung/widgets/myStore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  int _selectedIndexValue = 0;

  void onValueChanged(int newValue) {
    setState(() {
      _selectedIndexValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
                offset: Offset(150, -20.93),
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
                    CachedNetworkImage(
                      imageUrl: userProvider.userModel?.image.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 3.0),
                          ],
                        ),
                      ),
                      placeholder: (context, url) => Center(child: SpinKitThreeBounce(color: black, size: 10.0)),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/userProvider.png"),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: '${userProvider.userModel?.name}',
                          size: 20,
                          weight: FontWeight.w700,
                          over: TextOverflow.fade,
                        ),
                        CustomText(
                          text: '${userProvider.userModel?.email}',
                          size: 12,
                          color: white,
                          over: TextOverflow.fade,
                        ),
                        (userProvider.userModel?.phoNumber != null)
                            ? CustomText(
                                text: '+62${userProvider.userModel?.phoNumber}',
                                size: 12,
                                color: white,
                                over: TextOverflow.fade,
                              )
                            : null
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
            margin: EdgeInsets.only(left: 16.0, top: 130.0, right: 16.0),
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
                        text: NumberFormat.compactCurrency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(userProvider.userModel?.balance),
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset("assets/icons/pointColor.png"),
                      CustomText(text: 'Poin'),
                      CustomText(
                        text: NumberFormat.compactCurrency(
                                locale: 'id', symbol: '', decimalDigits: 0)
                            .format(userProvider.userModel?.point),
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset("assets/icons/weightColor.png"),
                      CustomText(text: 'Sampah'),
                      CustomText(
                        text: NumberFormat.compactCurrency(
                                locale: 'id', symbol: '', decimalDigits: 0)
                            .format(userProvider.userModel?.weight),
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
