import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/cartTrashModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/services/trashReceiveService.dart';
import 'package:lingkung/services/userService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class CarTrashCard extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  final CarTrashModel carTrashModel;
  CarTrashCard({this.carTrashModel, this.scaffold});
  _CarTrashCardState createState() => _CarTrashCardState();
}

class _CarTrashCardState extends State<CarTrashCard> {
  TrashReceiveServices _trashReceiveService = TrashReceiveServices();
  UserServices _userService = UserServices();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Card(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: widget.carTrashModel.image.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
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
                              image: DecorationImage(image: AssetImage("assets/images/noimage.png"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0)
                              ]),
                          )),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        CustomText(
                            text: widget.carTrashModel.name,
                            line: 2,
                            over: TextOverflow.fade,
                            weight: FontWeight.w500),
                        SizedBox(height: 5.0),
                        CustomText(
                            text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0)
                                    .format(widget.carTrashModel.price) +
                                ' /Kg',
                            color: Colors.red),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                loading = true;
                                bool value =
                                    await userProvider.removeFromCarTrash(
                                        carTrash: widget.carTrashModel);
                                if (value) {
                                  _trashReceiveService.updateTrashReceive({
                                    "id": widget.carTrashModel.trashTypeId,
                                    "isCheck": false,
                                  });
                                  userProvider.reloadUserModel();
                                  print("Removed from Cart!");
                                  widget.scaffold.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text("Removed from Cart!")));
                                  setState(() {
                                    loading = false;
                                  });
                                  return;
                                } else {
                                  print("ITEM WAS NOT REMOVED");
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            InkWell(
                                onTap: () {
                                  if (widget.carTrashModel.weight != 1) {
                                    setState(() {
                                      // _userService.updateCarTrash(
                                      //   userId: userProvider.user.uid,
                                      //   values: {
                                      //   "id": widget.carTrashModel.id,
                                      //   "weight": widget.carTrashModel.weight -= 1,
                                      // });
                                    });
                                  }
                                },
                                child: Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: yellow, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Icon(Icons.remove,
                                        color: Colors.grey, size: 14.0))),
                            SizedBox(width: 10.0),
                            CustomText(text: widget.carTrashModel.weight.toString() + ' Kg'),
                            SizedBox(width: 10.0),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                      // _userService.updateCarTrash(
                                      //   userId: userProvider.user.uid,
                                      //   values: {
                                      //   "id": widget.carTrashModel.id,
                                      //   "weight": widget.carTrashModel.weight += 1,
                                      // });
                                    });
                                },
                                child: Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Icon(Icons.add,
                                        color: Colors.grey, size: 14.0)))
                          ]
                        )
                      ]))
                ])));
  }
}
