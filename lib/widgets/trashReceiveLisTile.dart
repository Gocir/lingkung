import 'package:flutter/material.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/providers/trashReceiveProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class TrashReceiveLisTile extends StatelessWidget {
  final PartnerModel partner;
  TrashReceiveLisTile({this.partner});

  @override
  Widget build(BuildContext context) {
    final trashReceiveProvider = Provider.of<TrashReceiveProvider>(context);
    trashReceiveProvider.loadTrashReceiveByPartner(partner.id);
    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: trashReceiveProvider.trashReceiveByPartner.length,
          itemBuilder: (_, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: CustomText(
                  text: trashReceiveProvider.trashReceiveByPartner[index].trashName,
                  size: 16,
                  color: grey,
                  weight: FontWeight.w500,
                ),
                subtitle: CustomText(
                  text: 'Rp ${trashReceiveProvider.trashReceiveByPartner[index].price.toString()} /Kg',
                  size: 16,
                  color: black,
                  weight: FontWeight.w600,
                ),
                trailing: GestureDetector(
                  child: Icon(Icons.edit, color: blue,),
                  onTap: () {},
                ),
              ),
            );
          }),
    );
  }
}
