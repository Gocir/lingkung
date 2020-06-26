import 'package:flutter/material.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/providers/trashReceiveProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/animatedButton.dart';
import 'package:provider/provider.dart';

class TrashReceiveLisTile extends StatefulWidget {
  final PartnerModel partner;
  TrashReceiveLisTile({this.partner});

  @override
  _TrashReceiveLisTileState createState() => _TrashReceiveLisTileState();
}

class _TrashReceiveLisTileState extends State<TrashReceiveLisTile> {
  bool _checked = false;
  // List<bool> _checked = List();

  // void _onSelected(bool selected, trashReceiveId) {
  //   if (selected == true) {
  //     setState(() {
  //       _checked.add(trashReceiveId);
  //     });
  //   } else {
  //     setState(() {
  //       _checked.remove(trashReceiveId);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final trashReceiveProvider = Provider.of<TrashReceiveProvider>(context);
    trashReceiveProvider.loadTrashReceiveByPartner(widget.partner.id);
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: trashReceiveProvider.trashReceiveByPartner.length,
          itemBuilder: (_, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: CheckboxListTile(
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
                secondary: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 50,
                    child: Image.asset(
                      trashReceiveProvider.trashReceiveByPartner[index].image,
                      fit: BoxFit.cover,
                    )),
                activeColor: blue,
                checkColor: white,
                value: _checked,
                onChanged: (value) {
                  setState(() {
                      _checked = value;
                    });
                }
              // child: ListTile(
              //   leading: Container(
              //       height: MediaQuery.of(context).size.height,
              //       width: 50,
              //       child: Image.asset(
              //         trashReceiveProvider.trashReceiveByPartner[index].image,
              //         fit: BoxFit.cover,
              //       )),
              //   title: CustomText(
              //     text: trashReceiveProvider
              //         .trashReceiveByPartner[index].trashName,
              //     size: 16,
              //     color: grey,
              //     weight: FontWeight.w500,
              //   ),
              //   subtitle: CustomText(
              //     text:
              //         'Rp ${trashReceiveProvider.trashReceiveByPartner[index].price.toString()} /Kg',
              //     size: 16,
              //     color: black,
              //     weight: FontWeight.w600,
              //   ),
                // trailing: AnimatedButton(
                //   textSelected: "",
                //   textUnselected: "Pilih",
                //   selected: _selected,
                //   onChange: (value) {
                //     setState(() {
                //       _selected = value;
                //     });
                //   },
                // ),
              )
            );
          })
    );
  }
}
