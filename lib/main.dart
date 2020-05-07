import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingkung/screens/loginView.dart';
import 'package:lingkung/screens/privacyPolicy.dart';
import 'package:lingkung/screens/registerView.dart';
import 'package:lingkung/screens/splash.dart';
import 'package:lingkung/screens/termsOfService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lingkung',
      home: Splash()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
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
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(16.0),
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
                          fontWeight: FontWeight.bold
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
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(50.0)
                                ),
                                child: Text(
                                  "MASUK",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => RegisterView(),
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.lightGreen,
                                    width: 3.0),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Text(
                                  "DAFTAR",
                                  style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) => LoginView(),
                          // ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          child: Text(
                            "Facebook",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold
                            )
                          )
                        ),
                      ),
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
                                color: Colors.black,
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
                                color: Colors.lightGreen,
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: ' dan ',
                              style: TextStyle(
                                color: Colors.black,
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
                                color: Colors.lightGreen,
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

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(left: 16.0, top: 40.0, bottom: 40.0),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Image.asset(
//                   'assets/images/logos.png',
//                   height: 30.0,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(25.0),
//               child: Column(
//                 children: <Widget>[
//                   Center(
//                     child: Image(
//                       image: AssetImage(
//                         'assets/images/otentikasi.png',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         'Selamat Datang di Lingkung!',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         'Solusi untuk lingkunganmu dari sampah dengan Lingkung, pasti bersih dan untung!',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 14.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 10.0, bottom: 15.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) => LoginView(),
//                         ));
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 45.0,
//                         decoration: BoxDecoration(
//                           color: Colors.lightGreen,
//                           borderRadius: BorderRadius.circular(50.0)
//                         ),
//                         child: Text(
//                           "MASUK",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.bold
//                           )
//                         )
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0, top: 12.0, right: 16.0, bottom: 10.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) => RegisterView(),
//                         ));
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 45.0,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.lightGreen,
//                             width: 3.0),
//                           borderRadius: BorderRadius.circular(50.0),
//                         ),
//                         child: Text(
//                           "DAFTAR",
//                           style: TextStyle(
//                             color: Colors.lightGreen,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.bold
//                           )
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         // Navigator.push(context, MaterialPageRoute(
//                         //   builder: (context) => LoginView(),
//                         // ));
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 45.0,
//                         decoration: BoxDecoration(
//                           color: Colors.blue[800],
//                           borderRadius: BorderRadius.circular(50.0)
//                         ),
//                         child: Text(
//                           "Facebook",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.bold
//                           )
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     children: <Widget>[
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Dengan masuk atau mendaftar, kamu menyetujui ',
//                               style: TextStyle(
//                                 color: Colors.black,
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
//                                 color: Colors.black,
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
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }