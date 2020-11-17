import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:lingkung/providers/userProvider.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
// Widgets
import 'package:lingkung/widgets/profile/myAccount.dart';
import 'package:lingkung/widgets/profile/myStore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndexValue = 0;

  void onValueChanged(int newValue) {
    setState(() {
      _selectedIndexValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final _children = <int, Widget>{
      0: CustomText(
        text: 'Akun Saya',
        color: _selectedIndexValue == 1 ? black : white,
      ),
      1: CustomText(
        text: 'Toko Saya',
        color: _selectedIndexValue == 0 ? black : white,
      ),
    };

    return SafeArea(
      child: Scaffold(
        backgroundColor: blue,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(-14.23, 12.85),
                    child:
                        // Adobe XD layer: 'grass1' (shape)
                        Container(
                      width: 118.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/grass11.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(150, -44.93),
                    child:
                        // Adobe XD layer: 'grass2' (shape)
                        Container(
                      width: 133.0,
                      height: 149.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/grass22.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0),
                    child: Row(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: userProvider.userModel?.image.toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              color: white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SpinKitThreeBounce(color: black, size: 10.0),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/user.png"),
                                  fit: BoxFit.cover),
                              color: white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomText(
                              text: (userProvider.userModel?.name == null)
                                  ? 'Sobat Lingkung'
                                  : '${userProvider.userModel.name}',
                              size: 20,
                              weight: FontWeight.w700,
                              over: TextOverflow.fade,
                            ),
                            CustomText(
                              text: (userProvider.userModel?.email == null)
                                  ? 'nama@lingkung.domain'
                                  : '${userProvider.userModel.email}',
                              size: 12,
                              color: white,
                              over: TextOverflow.fade,
                            ),
                            CustomText(
                              text: '${userProvider.user?.phoneNumber}',
                              size: 12,
                              color: white,
                              over: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 66.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50.666),
                        Center(
                          child: CupertinoSlidingSegmentedControl(
                            thumbColor: green,
                            groupValue: _selectedIndexValue,
                            children: _children,
                            onValueChanged: onValueChanged,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        _selectedIndexValue == 0
                            ? MyAccount(userModel: userProvider.userModel)
                            : MyStore(userModel: userProvider.userModel)
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 100.0,
                margin: EdgeInsets.only(left: 16.0, top: 106.0, right: 16.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset("assets/icons/balanceColor.png"),
                        CustomText(text: 'Saldo'),
                        CustomText(
                          text: NumberFormat.compactCurrency(
                            locale: 'id',
                            symbol: 'Rp ',
                            decimalDigits: 0,
                          ).format((userProvider.userModel?.balance == null)
                              ? 0
                              : userProvider.userModel?.balance),
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset("assets/icons/pointColor.png"),
                        CustomText(text: 'Poin'),
                        CustomText(
                          text: NumberFormat.compactCurrency(
                            locale: 'id',
                            symbol: '',
                            decimalDigits: 0,
                          ).format((userProvider.userModel?.point == null)
                              ? 0
                              : userProvider.userModel?.point),
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset("assets/icons/weightColor.png"),
                        CustomText(text: 'Sampah'),
                        CustomText(
                          text: NumberFormat.compactCurrency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format((userProvider.userModel?.weight
                                          ?.toInt() ==
                                      null)
                                  ? 0
                                  : userProvider.userModel?.weight?.toInt()) +
                              ' Kg',
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
