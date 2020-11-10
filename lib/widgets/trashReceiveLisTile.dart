import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/models/trashCartModel.dart';
import 'package:lingkung/providers/trashCartProvider.dart';
import 'package:lingkung/services/trashCartService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class TrashReceiveLisTile extends StatefulWidget {
  final List<String> checkList;
  final UserModel userModel;
  final PartnerModel partner;
  final TrashReceiveModel trashReceiveModel;
  TrashReceiveLisTile({this.partner, this.userModel, this.trashReceiveModel, this.checkList});

  @override
  _TrashReceiveLisTileState createState() => _TrashReceiveLisTileState();
}

class _TrashReceiveLisTileState extends State<TrashReceiveLisTile> {
  TrashCartServices _trashCartService = TrashCartServices();

  List<TrashCartModel> trashCart;
  TrashCartModel trashItem;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final trashCartProvider = Provider.of<TrashCartProvider>(context);
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: widget.trashReceiveModel.image.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0)
                              ])),
                      placeholder: (context, url) => Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0)
                              ]),
                          child: SpinKitThreeBounce(color: black, size: 10.0)),
                      errorWidget: (context, url, error) => Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/noimage.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0.0, 0.0), blurRadius: 3.0)]))),
                  SizedBox(width: 16.0),
                  Expanded(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        CustomText(
                            text: '${widget.trashReceiveModel.trashName}',
                            line: 2,
                            over: TextOverflow.ellipsis),
                        SizedBox(height: 5.0),
                        CustomText(
                            text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0)
                                    .format(widget.trashReceiveModel.price) +
                                ' /Kg',
                            color: Colors.red,
                            size: 16.0,
                            weight: FontWeight.w600)
                      ])),
                  Checkbox(
                      activeColor: blue,
                      value: isCheck,
                      onChanged: (value) async {
                        trashCart =
                            await _trashCartService.getTrashCartByReceive(
                                userId: widget.userModel.id,
                                trashTypeId: widget.trashReceiveModel.id);
                        for (int i = 0; i < trashCart.length; i++) {
                          trashItem = trashCart[i];
                        }

                        setState(() {
                          isCheck = value;

                          if (isCheck == true && trashCart.isEmpty) {
                            trashCartProvider.addTrashCart(
                                userId: widget.userModel.id,
                                trashReceiveModel: widget.trashReceiveModel);
                            widget.checkList.add(widget.trashReceiveModel.id);
                            print('saved!');
                            print(trashCart);
                          } else if (isCheck == true && trashCart.isNotEmpty) {
                            widget.checkList.add(widget.trashReceiveModel.id);
                            print('Already');
                            print(trashCart);
                            return;
                          } else if (isCheck == false && trashCart.isNotEmpty) {
                            _trashCartService.deleteFromCart(
                                userId: widget.userModel.id,
                                docId: trashItem.id);
                            widget.checkList.remove(widget.trashReceiveModel.id);
                            print(trashCart);
                            print("Removed from Cart!");
                          } else {
                            print('Was Removed');
                            print(trashCart);
                            return;
                          }
                          print(isCheck);
                        });
                      })
                ])));
  }
}
