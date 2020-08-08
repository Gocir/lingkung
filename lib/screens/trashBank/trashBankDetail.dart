import 'package:flutter/material.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/screens/transporTrash/orderTrash.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/trashReceiveLisTile.dart';

class TrashBankDetail extends StatefulWidget {
  final PartnerModel partner;
  TrashBankDetail({this.partner});

  @override
  _TrashBankDetailState createState() => _TrashBankDetailState();
}

class _TrashBankDetailState extends State<TrashBankDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          backgroundColor: blue,
          expandedHeight: 180.0,
          flexibleSpace: FlexibleSpaceBar(
            // title: CustomText(
            //   text: 'BS. ${widget.partner.name}',
            //   size: 20.0,
            //   weight: FontWeight.w600,
            // ),
            background: Image.network(
              "${widget.partner.image}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: CustomText(
                      text: 'BS. ${widget.partner.name}',
                      size: 18,
                      weight: FontWeight.w700),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Container(child: Icon(Icons.location_on, color: yellow)),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: CustomText(
                        text: '${widget.partner.address}',
                        line: 4,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                CustomText(text: 'Jam Operasional', weight: FontWeight.w500),
                SizedBox(height: 5.0),
                CustomText(text: 'Setiap Hari pukul 06.00 - 21.00', size: 12),
                SizedBox(height: 10.0),
                Divider(),
                SizedBox(height: 10.0),
                CustomText(
                    text: 'Terima Jenis Sampah',
                    size: 16,
                    weight: FontWeight.w600),
                SizedBox(height: 10.0),
                TrashReceiveLisTile(partner: widget.partner),
                SizedBox(height: 30.0),
                Container(
                  height: 48.0,
                  child: RaisedButton(
                    color: green,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: CustomText(
                          text: 'LANJUT',
                          size: 16.0,
                          color: white,
                          weight: FontWeight.w700),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderTrash(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
