import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//  Models
import 'package:lingkung/models/userModel.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
//  Screens
import 'package:lingkung/screens/address/addressList.dart';
import 'package:lingkung/screens/authenticate/authenticate.dart';
import 'package:lingkung/screens/helps/helpFeatureList.dart';
import 'package:lingkung/screens/privacyPolicy.dart';
import 'package:lingkung/screens/termsOfService.dart';
import 'package:lingkung/screens/updateProfile.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class MyAccount extends StatefulWidget {
  final UserModel userModel;
  MyAccount({this.userModel});
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(text: 'Akun', weight: FontWeight.w700),
          SizedBox(height: 5.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: Image.asset("assets/icons/editProfileColor.png"),
                    title: CustomText(
                      text: 'Perbarui Profil',
                      weight: FontWeight.w500,
                    ),
                    trailing: Icon(Icons.chevron_right, color: grey),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateProfile(userModel: widget.userModel),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/placeholder.png"),
                    title: CustomText(text: 'Alamat', weight: FontWeight.w500),
                    trailing: Icon(Icons.chevron_right, color: grey),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddressList(userModel: widget.userModel),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/helpsColor.png"),
                    title: CustomText(text: 'Bantuan', weight: FontWeight.w500),
                    trailing: Icon(Icons.chevron_right, color: grey),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpFeatureList(),
                        ),
                      );
                    },
                  ),
                ],
              ).toList(),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            child: CustomText(
              text: 'Info lainnya',
              weight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 0),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: Image.asset("assets/icons/tosColor.png"),
                    title: CustomText(
                      text: 'Ketentuan Layanan',
                      weight: FontWeight.w500,
                    ),
                    trailing: Icon(Icons.chevron_right, color: grey),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsOfService(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/privacyColor.png"),
                    title: CustomText(
                      text: 'Kebijakan Privacy',
                      weight: FontWeight.w500,
                    ),
                    trailing: Icon(Icons.chevron_right, color: grey),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicy(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    dense: true,
                    leading: Image.asset("assets/icons/phoneColor.png"),
                    title: CustomText(text: 'Versi', weight: FontWeight.w500),
                    trailing:
                        CustomText(text: '1.1.1', color: grey, size: 12.0),
                  ),
                ],
              ).toList(),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 48.0,
            child: FlatButton(
              color: green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: CustomText(
                text: 'KELUAR',
                size: 16.0,
                color: white,
                weight: FontWeight.w700,
              ),
              onPressed: () async {
                await userProvider.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Authenticate(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
