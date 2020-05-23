import 'package:flutter/gestures.dart';
import 'package:lingkung/screens/authenticate/loginView.dart';
import 'package:lingkung/screens/authenticate/registerView.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/screens/privacyPolicy.dart';
import 'package:lingkung/screens/termsOfService.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/images/logos.png',
                        height: 35.0,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      child: Image.asset(
                        'assets/images/otentikasi.png',
                      ),
                    ),
                  ),
                ]
              ),
            )
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'Selamat Datang di Lingkung!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Solusi untuk lingkunganmu dari sampah dengan Lingkung, pasti bersih dan untung!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 45.0,
                            child: RaisedButton(
                              color: Colors.lightGreen,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)
                              ),
                              child: Center(
                                child: Text(
                                  "MASUK",
                                  style: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ));
                              }
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 45.0,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                  color: const Color(0xff9bc53d),
                                  width: 3.0)
                              ),
                              child: Center(
                                child: Text(
                                  "DAFTAR",
                                  style: TextStyle(
                                    color: const Color(0xff9bc53d),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700
                                  )
                                )
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => RegisterView(),
                                ));
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Dengan masuk atau mendaftar, kamu menyetujui ',
                              style: TextStyle(
                                color: const Color(0xff000000),
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Ketentuan Layanan',
                              recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => TermsOfService()),);
                              },
                              style: TextStyle(
                                color: const Color(0xff9bc53d),
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: ' dan ',
                              style: TextStyle(
                                color: const Color(0xff000000),
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Kebijakan Privasi.',
                              recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => PrivacyPolicy()),);
                              },
                              style: TextStyle(
                                color: const Color(0xff9bc53d),
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            )
          ),
        ]
      )
    );
  }
}

// class Authenticate extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             flex: 2,
//             child: Container(
//               margin: EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       alignment: Alignment.topLeft,
//                       child: Image.asset(
//                         'assets/images/logos.png',
//                         height: 35.0,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 3,
//                     child: Container(
//                       child: Image.asset(
//                         'assets/images/otentikasi.png',
//                       ),
//                     ),
//                   ),
//                 ]
//               ),
//             )
//           ),
//           Flexible(
//             flex: 1,
//             child: Container(
//               margin: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       child: Text(
//                         'Selamat Datang di Lingkung!',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.w700
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       alignment: Alignment.topCenter,
//                       child: Text(
//                         'Solusi untuk lingkunganmu dari sampah dengan Lingkung, pasti bersih dan untung!',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 14.0,
//                         ),
//                       ),
//                     )
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Row(
//                       children: <Widget>[
//                         Flexible(
//                           flex: 1,
//                           child: Container(
//                             height: 45.0,
//                             child: RaisedButton(
//                               color: Colors.lightGreen,
//                               elevation: 2.0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0)
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "MASUK",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w700
//                                   )
//                                 ),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(
//                                   builder: (context) => LoginView(),
//                                 ));
//                               }
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 15.0),
//                         Flexible(
//                           flex: 1,
//                           child: Container(
//                             height: 45.0,
//                             child: RaisedButton(
//                               color: Colors.white,
//                               elevation: 2.0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50.0),
//                                 side: BorderSide(
//                                   color: Colors.lightGreen,
//                                   width: 3.0)
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "DAFTAR",
//                                   style: TextStyle(
//                                     color: Colors.lightGreen,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w700
//                                   )
//                                 )
//                               ),
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(
//                                   builder: (context) => RegisterView(),
//                                 ));
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       child: RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Dengan masuk atau mendaftar, kamu menyetujui ',
//                               style: TextStyle(
//                                 color: const Color(0xffffffff),
//                                 fontFamily: 'Poppins',
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'Ketentuan Layanan',
//                               recognizer: new TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) => TermsOfService()),);
//                               },
//                               style: TextStyle(
//                                 color: Colors.lightGreen,
//                                 fontFamily: 'Poppins',
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                             TextSpan(
//                               text: ' dan ',
//                               style: TextStyle(
//                                 color: const Color(0xffffffff),
//                                 fontFamily: 'Poppins',
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'Kebijakan Privasi.',
//                               recognizer: new TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) => PrivacyPolicy()),);
//                               },
//                               style: TextStyle(
//                                 color: Colors.lightGreen,
//                                 fontFamily: 'Poppins',
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]
//               ),
//             )
//           ),
//         ]
//       )
//     );
//   }
// }