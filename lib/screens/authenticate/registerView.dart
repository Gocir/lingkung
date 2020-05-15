// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:lingkung/screens/helps/helpRegisterList.dart';

// class RegisterView extends StatefulWidget {
  
//   @override
//   _RegisterViewState createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
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
//                   builder: (context) => HelpRegisterList(),
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
//                   // Flexible(
//                   //   flex: 2,
//                   //   child: Container(
//                   //     child: Image.asset(
//                   //       'assets/images/masuk.png'
//                   //     ),
//                   //   ),
//                   // ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       child: Text(
//                         'Lengkapi data dirimu di bawah ini',
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
//                     child: Container(
//                       margin: EdgeInsets.only(top: 16.0),
//                       child: TextField(
//                         style: TextStyle(
//                           fontFamily: 'Poppins'
//                         ),
//                         decoration: InputDecoration(
//                           labelText: 'Nama Lengkap',
//                           labelStyle: TextStyle(
//                             color: Colors.grey,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.0
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.green
//                             )
//                           )
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       margin: EdgeInsets.only(top: 16.0),
//                       child: TextField(
//                         style: TextStyle(
//                           fontFamily: 'Poppins'
//                         ),
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           labelStyle: TextStyle(
//                             color: Colors.grey,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.0
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.green
//                             )
//                           )
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
//                             margin: EdgeInsets.only(top: 30.0, right: 16.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30.0),
//                               color: Colors.grey[200],
//                             ),
//                             child: CountryCodePicker(
//                               initialSelection: 'ID',
//                               showCountryOnly: true,
//                               alignLeft: false,
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           flex: 2,
//                           child: Container(
//                             margin: EdgeInsets.only(top: 16.0),
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Nomor HP',
//                                 labelStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16.0
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.green
//                                   )
//                                 )
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                       child: Container(
//                       height: 45.0,
//                       margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
//                       child: Material(
//                         borderRadius: BorderRadius.circular(50.0),
//                         shadowColor: Colors.grey,
//                         color: Colors.lightGreen,
//                         elevation: 2.0,
//                         child: GestureDetector(
//                           onTap: () {},
//                             child: Center(
//                               child: Text(
//                                 'LANJUT',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Poppins',
//                                 ),
//                               ),
//                             ),
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

// import 'package:flutter/material.dart';
// import 'package:lingkung/screens/helps/helpRegisterList.dart';
// import 'package:lingkung/services/auth.dart';
// import 'package:lingkung/utilities/loading.dart';

// class RegisterView extends StatefulWidget {

//   @override
//   _RegisterViewState createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {

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
//                   builder: (context) => HelpRegisterList(),
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
//                     flex: 1,
//                     child: Container(
//                       child: Text(
//                         'Lengkapi data dirimu di bawah ini',
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
//                                 validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
//                                 validator: (val) => val.length < 6  ? 'Enter a password 6+ char long' : null,
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
//                       child: Container(
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
//                             'DAFTAR',
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
//                             dynamic result = await _auth.signUpWithEmailAndPassword(email, password);
//                             if (result == null) {
//                               setState(() {
//                                 error = 'please supply a valid email';
//                                 loading = false;
//                               });
//                             }
//                           }
//                         }
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
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  bool loading = false;
  
  //text field state
  String email = '';
  String password = '';
  String error = '';

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
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                  )
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                  )
                ),
                validator: (val) => val.length < 6  ? 'Enter a password 6+ char long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async{
                  if (_formkey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signUpWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'please supply a valid email';
                        loading = false;
                      });
                    }
                  }
                }
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
