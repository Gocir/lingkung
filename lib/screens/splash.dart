import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lingkung/screens/onboarding.dart';

class Splash extends StatefulWidget {
  
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async{
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => Onboarding()),
    );
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment(0, 0.75),
              child: Image.asset(
                'assets/images/logos.png',
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/savearth.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
