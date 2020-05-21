import 'package:flutter/material.dart';
import 'package:lingkung/services/auth.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        label: Text('Logout'),
        icon: Icon(Icons.person),
        onPressed: () async {
          await _auth.signOut();
        },
      )
    );
  }
}
