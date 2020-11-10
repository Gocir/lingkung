import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/models/trashCartModel.dart';
import 'package:lingkung/providers/trashCartProvider.dart';
import 'package:lingkung/services/trashCartService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class TrashCartCard extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  final TrashCartModel itemCart;
  final UserModel userModel;
  final List<String> checkList;
  TrashCartCard({this.itemCart, this.userModel, this.scaffold, this.checkList});
  _TrashCartCardState createState() => _TrashCartCardState();
}

class _TrashCartCardState extends State<TrashCartCard> {
  TrashCartServices _trashCartService = TrashCartServices();

  String status ="";
  bool loading = false;
  
  @override
  Widget build(BuildContext context) {
    final trashCartProvider = Provider.of<TrashCartProvider>(context);
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
                      imageUrl: widget.itemCart.image.toString(),
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
                              ])
                          )),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        CustomText(
                            text: widget.itemCart.name,
                            line: 2,
                            over: TextOverflow.fade,
                            weight: FontWeight.w500),
                        SizedBox(height: 5.0),
                        CustomText(
                            text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0)
                                    .format(widget.itemCart.price) +
                                ' /Kg',
                            color: Colors.red),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                setState(() {  
                                  loading = true;
                                });
                                await _trashCartService.deleteFromCart(
                                userId: widget.userModel.id,
                                docId: widget.itemCart.id);
                                widget.checkList.remove(widget.itemCart.trashTypeId);
                                trashCartProvider.loadTrashCart();
                                print("Removed from Cart!");
                                widget.scaffold.currentState.showSnackBar(
                                    SnackBar(
                                        content: Text("Removed from Cart!")));
                                setState(() {
                                  loading = false;
                                });
                                
                              },
                              child: Icon(
                                Icons.delete
                              )
                            ),
                            SizedBox(width: 10.0),
                            InkWell(
                                onTap: () async {
                                  status = "Decrement";
                                  if (widget.itemCart.weight != 1) {
                                    await trashCartProvider.updateItemWeight(userId: widget.userModel.id, status: status, trashCartModel: widget.itemCart);
                                    trashCartProvider.loadTrashCart();
                                    print("Decrement!");
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
                            CustomText(text: widget.itemCart.weight.toString() + ' Kg'),
                            SizedBox(width: 10.0),
                            InkWell(
                                onTap: () async {
                                  status = "Increment";
                                  await trashCartProvider.updateItemWeight(userId: widget.userModel.id, status: status, trashCartModel: widget.itemCart);
                                  trashCartProvider.loadTrashCart();
                                  print("Increment!");
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
