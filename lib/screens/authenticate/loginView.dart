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
//         backgroundColor: Colors.white,
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
//                           fontWeight: FontWeight.bold
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
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lingkung/screens/helps/helpLoginList.dart';
// import 'package:lingkung/services/auth.dart';
// import 'package:lingkung/utilities/loading.dart';

// class LoginView extends StatefulWidget {
  
//   @override
//   _LoginViewState createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {

//   final AuthService _auth = AuthService();
//   final _formkey = GlobalKey<FormState>();

//   bool loading = false;
  
//   //text field state
//   String email = '';
//   String password = '';
//   String error = '';

//   @override
//   Widget build(BuildContext context) {
//     return loading ? Loading() : Scaffold(
//       resizeToAvoidBottomPadding: false,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
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
//             flex: 2,
//             child: Container(
//               margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Flexible(
//                     flex: 2,
//                     child: Container(
//                       child: Image.asset(
//                         'assets/images/masuk.png',
//                         scale: 1.25,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       child: Text(
//                         'Silakan masukkan Email & Password yang terdaftar',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Form(
//                       key: _formkey,
//                       child: Column(
//                         children: <Widget>[
//                           Flexible(
//                             flex: 1,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 16.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Email',
//                                   labelStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16.0
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.blueAccent
//                                     )
//                                   ),
//                                 ),
//                                 validator: (val) => val.isEmpty ? 'Masukkan email' : null,
//                                 onChanged: (val) {
//                                   setState(() => email = val);
//                                 }
//                               ),
//                             ),
//                           ),
//                           Flexible(
//                             flex: 1,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 16.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Password',
//                                   labelStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16.0
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.blueAccent
//                                     )
//                                   ),
//                                 ),
//                                 obscureText: true,
//                                 validator: (val) => val.length < 6  ? 'Masukkan panjang password >6' : null,
//                                 onChanged: (val) {
//                                   setState(() => password = val);
//                                 }
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       height: 45.0,
//                       margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
//                       child: RaisedButton(
//                         color: Colors.lightGreen,
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50)
//                         ),
//                         child: Center(
//                           child: Text(
//                             'MASUK',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                         onPressed: () async{
//                           if (_formkey.currentState.validate()){
//                             setState(() => loading = true);
//                             dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                             if (result == null) {
//                               setState(() {
//                                 error = 'Tidak dapat masuk dengan akun tersebut';
//                                 loading = false;
//                               });
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       height: 45.0,
//                       margin: EdgeInsets.only(top: 30.0),
//                       child: Text(
//                         error,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Poppins',
//                         ),
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
// }

import 'package:lingkung/screens/helps/helpLoginList.dart';
import 'package:lingkung/services/auth.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/style.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  bool loading = false;
  
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Login to Lingkung'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HelpLoginList(),
                ));
              },
              child: Icon(
                Icons.help_outline,
                size: 26.0,
              ),
            )
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6  ? 'Enter a password 6+ char long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async{
                  if (_formkey.currentState.validate()){
                    // setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'could not sign in with those credentials';
                        loading = false;
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              RaisedButton(
                child: Text('Login Anon'),
                onPressed: () async{
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('error Login');
                  }else{
                    print('Loged In');
                    print(result.uid);
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          )
        ),
      ),
    );
  }
}
