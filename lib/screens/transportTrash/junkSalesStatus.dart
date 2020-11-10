import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/junkSalesProvider.dart';
import 'package:lingkung/widgets/junkSalesStatus/deliverOrders.dart';
import 'package:lingkung/widgets/junkSalesStatus/receiveOrders.dart';
import 'package:lingkung/widgets/junkSalesStatus/startOrders.dart';
import 'package:lingkung/widgets/junkSalesStatus/takeOrders.dart';
import 'package:provider/provider.dart';

class JunkSalesStatus extends StatefulWidget {
  final UserModel userModel;
  final String junkSalesId;
  JunkSalesStatus({this.userModel, this.junkSalesId});
  @override
  _JunkSalesStatusState createState() => _JunkSalesStatusState();
}

class _JunkSalesStatusState extends State<JunkSalesStatus> {
  @override
  Widget build(BuildContext context) {
    final junkSalesProvider = Provider.of<JunkSalesProvider>(context);
    junkSalesProvider.loadSingleJunkSales(widget.junkSalesId);
    junkSalesProvider.loadListTrash(widget.junkSalesId);

    return SafeArea(
            top: false,
            child: (junkSalesProvider.junkSalesModel?.status == "Start Orders") ?
            StartOrders(junkSalesId: widget.junkSalesId) :
            (junkSalesProvider.junkSalesModel?.status == "Take Orders") ?
            TakeOrders(junkSalesId: widget.junkSalesId) :
            (junkSalesProvider.junkSalesModel?.status == "Receive Orders") ?
            ReceiveOrders(junkSalesId: widget.junkSalesId) :
            (junkSalesProvider.junkSalesModel?.status == "Deliver Orders") ?
            DeliverOrders(junkSalesId: widget.junkSalesId,) :
            Container(),
          );
  }
}
