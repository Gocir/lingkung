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
//         backgroundColor: const Color(0xffffffff),
//         iconTheme: IconThemeData(
//           color: const Color(0xff000000)
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
//               margin: EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0),
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
//                           fontWeight: FontWeight.w700
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       margin: EdgeInsets.only(top: 10.0),
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
//                       margin: EdgeInsets.only(top: 10.0),
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
//                             margin: EdgeInsets.only(top: 10.0),
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
//                         color: const Color(0xff9bc53d),
//                         elevation: 2.0,
//                         child: GestureDetector(
//                           onTap: () {},
//                             child: Center(
//                               child: Text(
//                                 'LANJUT',
//                                 style: TextStyle(
//                                   color: const Color(0xffffffff),
//                                   fontWeight: FontWeight.w700,
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

import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/helps/helpRegisterList.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
              iconTheme: IconThemeData(color: const Color(0xff000000)),
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
                            builder: (context) => HelpRegisterList(),
                          ));
                    },
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Lengkapi data dirimu di bawah ini',
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
                              controller: authProvider.name,
                              decoration: InputDecoration(
                                labelText: 'Nama',
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xff5bc0eb))),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Isi Nama Kamu' : null,
                            ),
                          ),
                          SizedBox(height: 10),
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
                                    borderSide: BorderSide(
                                        color: const Color(0xff5bc0eb))),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Isi alamat email kamu' : null,
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
                                    borderSide: BorderSide(
                                        color: const Color(0xff5bc0eb))),
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
                      margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
                      child: RaisedButton(
                          color: const Color(0xff9bc53d),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'DAFTAR',
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
                              dynamic result = await authProvider.register();
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
                                    text: "Tolong isi data dengan benar",
                                    color: white,
                                    weight: FontWeight.w600,
                                  )));
                                  loading = false;
                                });
                              }
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
