import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
//  Screens
import 'package:lingkung/screens/authenticate/loginView.dart';
import 'package:lingkung/screens/authenticate/registerView.dart';
import 'package:lingkung/screens/privacyPolicy.dart';
import 'package:lingkung/screens/termsOfService.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: white,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
                backgroundColor: white,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Image.asset('assets/images/logos.png', height: 35.0)),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                            child: Image.asset('assets/images/otentikasi.png'))
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                  text: 'Selamat Datang di Lingkung!',
                                  size: 20.0,
                                  weight: FontWeight.w700),
                              CustomText(
                                  text:
                                      'Solusi untuk lingkunganmu dari sampah dengan Lingkung, pasti bersih dan untung!'),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            height: 45.0,
                                            child: RaisedButton(
                                                color: green,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0)),
                                                child: CustomText(
                                                    text: "MASUK",
                                                    color: white,
                                                    size: 16.0,
                                                    weight: FontWeight.w700),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginView()));
                                                              userProvider.clearController();
                                                }))),
                                    SizedBox(width: 15.0),
                                    Expanded(
                                        child: Container(
                                            height: 45.0,
                                            child: OutlineButton(
                                                color: white,
                                                highlightedBorderColor: green,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0)),
                                                borderSide: BorderSide(
                                                    color: green, width: 2.5),
                                                child: CustomText(
                                                    text: "DAFTAR",
                                                    color: green,
                                                    size: 16.0,
                                                    weight: FontWeight.w700),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RegisterView()));
                                                  userProvider.clearController();
                                                })))
                                  ]),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        'Dengan masuk atau mendaftar, kamu menyetujui ',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0)),
                                TextSpan(
                                    text: 'Ketentuan Layanan',
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TermsOfService()));
                                      },
                                    style: TextStyle(
                                        color: green,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0)),
                                TextSpan(
                                    text: ' dan ',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0)),
                                TextSpan(
                                    text: 'Kebijakan Privasi.',
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PrivacyPolicy()));
                                      },
                                    style: TextStyle(
                                        color: green,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0))
                              ]))
                            ]),
                      )
                    ]))));
  }
}
