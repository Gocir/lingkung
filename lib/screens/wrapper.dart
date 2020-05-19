import 'package:lingkung/main.dart';
import 'package:lingkung/models/user.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:lingkung/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);

    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MainPage();
    }
  }
}