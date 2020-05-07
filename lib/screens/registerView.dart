import 'package:flutter/material.dart';
import 'package:lingkung/screens/helpRegisterView.dart';

class RegisterView extends StatefulWidget {
  
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HelpRegisterView(),
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
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Flexible(
                  //   flex: 2,
                  //   child: Container(
                  //     child: Image.asset(
                  //       'assets/images/masuk.png'
                  //     ),
                  //   ),
                  // ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'Lengkapi data dirimu dibawah ini',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nomor HP',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                      child: Container(
                      height: 45.0,
                      margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(50.0),
                        shadowColor: Colors.grey,
                        color: Colors.lightGreen,
                        elevation: 2.0,
                        child: GestureDetector(
                          onTap: () {},
                            child: Center(
                              child: Text(
                                'LANJUT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}