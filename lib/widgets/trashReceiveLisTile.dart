import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/services/trashReceiveService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class TrashReceiveLisTile extends StatefulWidget {
  final PartnerModel partner;
  final TrashReceiveModel trashReceiveModel;
  TrashReceiveLisTile({this.partner, this.trashReceiveModel});

  @override
  _TrashReceiveLisTileState createState() => _TrashReceiveLisTileState();
}

class _TrashReceiveLisTileState extends State<TrashReceiveLisTile> {
  TrashReceiveServices _trashReceiveService = TrashReceiveServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
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
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover),
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
                            child: SpinKitThreeBounce(
                                color: black, size: 10.0)),
                        errorWidget: (context, url, error) => Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/noimage.png"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0)
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomText(
                              text: widget.trashReceiveModel.trashName,
                              line: 2,
                              over: TextOverflow.ellipsis,
                            ),
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
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: widget.trashReceiveModel.isCheck,
                        onChanged: (bool newValue) async {
                          setState(() {
                            _trashReceiveService.updateTrashReceive({
                              "id": widget.trashReceiveModel.id,
                              "isCheck": newValue,
                            });
                          });
                          if (newValue == true) {
                              bool value = await userProvider.addToCarTrash(
                                  trashReceiveModel: widget.trashReceiveModel);
                              if (value) {
                                print("Type Trash Added To Cart");
                                userProvider.reloadUserModel();
                                return;
                              } else {
                                print("Type Trash NOT Added To Cart");
                              }
                              print("LOADING SET TO FALSE");
                          } 
                          // else {
                          //     if(userProvider.userModel.carTrash == widget.trashReceiveModel.id)
                          //     bool value = await userProvider.removeFromCarTrash(
                          //             carTrash: item);
                          //     if (value) {
                          //       userProvider.reloadUserModel();
                          //       print("Removed from Cart!");
                          //       return;
                          //     } else {
                          //       print("ITEM WAS NOT REMOVED");
                          //     }
                          // }
                        },
                        activeColor: blue,
                      ),
                    ],
                  ),
                ),
              );
  }
}
