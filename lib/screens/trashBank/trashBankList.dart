import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/partnerLisTile.dart';
import 'package:lingkung/models/userModel.dart';

class TrashBankList extends StatefulWidget {
  final UserModel userModel;
  TrashBankList({this.userModel});
  @override
  _TrashBankListState createState() => _TrashBankListState();
}

class _TrashBankListState extends State<TrashBankList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: black),
          title: CustomText(
            text: 'Bank Sampah',
            color: black,
            size: 18.0,
            weight: FontWeight.w600,
          ),
        ),
        body: PartnerLisTile(userModel: widget.userModel),
      ),
    );
  }
}
