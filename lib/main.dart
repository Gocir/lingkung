import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingkung/models/user.dart';
import 'package:lingkung/screens/splash.dart';
import 'package:lingkung/screens/wrapper.dart';
import 'package:lingkung/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
      
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lingkung',
        home: Wrapper(),
      ),
    );
  }
}