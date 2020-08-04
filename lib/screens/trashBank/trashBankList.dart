import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/partnerLisTile.dart';

class TrashBankList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: blue,
        elevation: 0.0,
        iconTheme: IconThemeData(color: white),
        title: CustomText(
          text: 'Bank Sampah',
            color: white,
            size: 18.0,
            weight: FontWeight.w600,
        ),
      ),
      // extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PartnerLisTile()
      ),
    );
  }
}
