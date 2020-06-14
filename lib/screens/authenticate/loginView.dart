// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lingkung/screens/helps/helpLoginList.dart';
// import 'package:lingkung/screens/authenticate/verificationView.dart';
// import 'package:lingkung/providers/phoneAuth.dart';
// import 'package:lingkung/utilities/widget.dart';
// import 'package:provider/provider.dart';

// class LoginView extends StatefulWidget {

//   @override
//   _LoginViewState createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {

//   // TextEditingController phoneController = new TextEditingController();
//   String phoneNumber = "";

//   void _onCountryChange(CountryCode countryCode) {
//     this.phoneNumber =  countryCode.toString();
//   }

//   // void check(){
//   //   print("Full Text: "+ this.phoneNumber + phoneController.text);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       resizeToAvoidBottomPadding: false,
//       appBar: AppBar(
//         backgroundColor: const Color(0xffffffff),
//         iconTheme: IconThemeData(
//           color: Colors.black
//         ),
//         actions: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (context) => HelpLoginList(),
//                 ));
//               },
//               child: Icon(
//                 Icons.help_outline,
//                 size: 26.0,
//               ),
//             )
//           ),
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             flex: 1,
//             child: Container(
//               margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Flexible(
//                     flex: 2,
//                     child: Container(
//                       child: Image.asset(
//                         'assets/images/masuk.png'
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       child: Text(
//                         'Silakan masukkan Nomor HP-mu yang terdaftar',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.w700
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Row(
//                       children: <Widget>[
//                         Flexible(
//                           flex: 1,
//                           child: Container(
//                             margin: EdgeInsets.only(top: 16.0, right: 16.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30.0),
//                               color: Colors.grey[200],
//                             ),
//                             child: CountryCodePicker(
//                               onChanged: _onCountryChange,
//                               initialSelection: 'ID',
//                               favorite: ['+62'],
//                               showCountryOnly: true,
//                               alignLeft: false,
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           flex: 2,
//                           child: Container(
//                             margin: EdgeInsets.only(top: 16.0),
//                             child: PhoneNumberField(
//                               controller:
//                               Provider
//                                   .of<PhoneAuthDataProvider>(context, listen: false)
//                                   .phoneNumberController,
//                               prefix: _onCountryChange ?? "+62",
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       height: 45.0,
//                       margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
//                       child: RaisedButton(
//                         key: null,
//                         color: Colors.lightGreen,
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50)
//                         ),
//                         child: Center(
//                           child: Text(
//                             'LANJUT',
//                             style: TextStyle(
//                               color: const Color(0xffffffff),
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                         onPressed: startPhoneAuth,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _showSnackBar(String text) {
//     final snackBar = SnackBar(
//       content: Text('$text'),
//     );
//   }

//   startPhoneAuth() async {
//     final phoneAuthDataProvider =
//     Provider.of<PhoneAuthDataProvider>(context, listen: false);
//     phoneAuthDataProvider.loading = true;
//     // var countryProvider = Provider.of<CountryProvider>(context, listen: false);
//     bool validPhone = await phoneAuthDataProvider.instantiate(
//       dialCode: this.phoneNumber,
//       onCodeSent: () {
//         Navigator.of(context).pushReplacement(CupertinoPageRoute(
//             builder: (BuildContext context) => PhoneAuthVerify()));
//       },
//       onFailed: () {
//         _showSnackBar(phoneAuthDataProvider.message);
//       },
//       onError: () {
//         _showSnackBar(phoneAuthDataProvider.message);
//       });
//     if (!validPhone) {
//       phoneAuthDataProvider.loading = false;
//       _showSnackBar("Oops! Number seems invalid");
//       return;
//     }
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/helps/helpLoginList.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return loading
        ? Loading()
        : Scaffold(
          key: _scaffoldStateKey,
            resizeToAvoidBottomPadding: false,
            backgroundColor: const Color(0xffffffff),
            appBar: AppBar(
              backgroundColor: const Color(0xffffffff),
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, right: 16.0, bottom: 10.0),
                  height: 10.0,
                  child: RaisedButton(
                    color: const Color(0xff9bc53d),
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.help_outline,
                          color: const Color(0xffffffff),
                          size: 26.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Bantuan',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12.0,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpLoginList(),
                          ));
                    },
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(right: 16.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.push(context, MaterialPageRoute(
                //         builder: (context) => HelpLoginList(),
                //       ));
                //     },
                //     child: Icon(
                //       Icons.help_outline,
                //       size: 26.0,
                //     ),
                //   )
                // ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/masuk.png',
                      scale: 1.25,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Silakan masuk dengan Email & Password yang terdaftar',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            controller: authProvider.email,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent)),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Masukkan email kamu' : null,
                              ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextFormField(
                              controller: authProvider.password,
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent)),
                              ),
                              obscureText: true,
                              validator: (val) => val.length < 8
                                  ? 'Panjangnya harus lebih dari 8'
                                  : null,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45.0,
                    margin: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                      color: const Color(0xff9bc53d),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'MASUK',
                          style: TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await authProvider.login();
                                if (result != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()),
                                  );
                                  authProvider.clearController();
                                } else {
                                  setState(() {
                                    _scaffoldStateKey.currentState
                                        .showSnackBar(SnackBar(
                                            content: CustomText(
                                      text:
                                          "Tidak dapat masuk dengan akun tersebut",
                                      color: white,
                                      weight: FontWeight.w600,
                                    )));
                                  });
                                }
                              }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
