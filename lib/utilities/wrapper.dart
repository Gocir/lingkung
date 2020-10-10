import 'package:lingkung/main.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final auth = Provider.of<UserProvider>(context);
    print(auth);

    //return either home or authenticate widget
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Authenticate();
      case Status.Authenticated:
        return MainPage();
      default:
        return Authenticate();
    }
  }
}