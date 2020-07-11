import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
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
  // UserServices _userService = UserServices();

  String imageUrl;
  File _image;
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

    Future getImage() async {
      File _image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (_image == null) {
        return;
      }

      // String fileName = "${user.userModel?.id}${DateTime.now().toString()}.jpg";
      // StorageUploadTask uploadTask = storage.ref().child(fileName).putFile(_image);
      // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete.then((snapshot) => snapshot);
      // uploadTask.onComplete.then((snapshot) async {
      //   imageUrl = await taskSnapshot.ref.getDownloadURL();
      //   _userService.updateUserData({
      //     "image": imageUrl,
      //   });
      // });
    }

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
                        child: Stack(children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 6.0),
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: white,
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: (_image != null)
                                    ? Image.file(_image, fit: BoxFit.cover)
                                    : Image.asset("assets/images/user.png",
                                        fit: BoxFit.cover)),
                          ),
                          Positioned(
                              right: -15,
                              top: -15,
                              child: IconButton(
                                color: green,
                                icon: Icon(Icons.camera_alt, size: 20.0),
                                onPressed: () {
                                  getImage();
                                },
                              ))
                        ])),
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
                  VerticalDivider(),
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
                  VerticalDivider(),
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
