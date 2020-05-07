import 'package:flutter/material.dart';
import 'package:lingkung/screens/helpLoginView.dart';

class LoginView extends StatefulWidget {
  
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  builder: (context) => HelpLoginView(),
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
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: Image.asset(
                        'assets/images/masuk.png'
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'Silakan masukkan Nomor HP-mu yang terdaftar',
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
                        decoration: InputDecoration(
                          labelText: 'Nomor HP',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
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