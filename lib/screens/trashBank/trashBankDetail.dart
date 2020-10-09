import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/transporTrash/checkoutTrash.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/providers/trashReceiveProvider.dart';
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
    final userProvider = Provider.of<UserProvider>(context);
    final trashReceiveProvider = Provider.of<TrashReceiveProvider>(context);
    trashReceiveProvider.loadTrashReceiveByPartner(widget.partner.id);
    return SafeArea(
      top: false,
          child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            iconTheme: IconThemeData(color: black),
            backgroundColor: white,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: widget.partner.image.toString(),
                imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover))),
                placeholder: (context, url) => Center(
                    child: SpinKitThreeBounce(color: black, size: 10.0)),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/noimage.png"),
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
                        text: 'BS. ${widget.partner.businessName}',
                        size: 18,
                        weight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Container(
                          child: Icon(Icons.location_on, color: Colors.red)),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: CustomText(
                          text: '${widget.partner.addressModel.addressDetail}',
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
                  (trashReceiveProvider.trashReceiveByPartner.isNotEmpty)
                      ? Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(0.0),
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: trashReceiveProvider
                                  .trashReceiveByPartner.length,
                              itemBuilder: (_, index) {
                                TrashReceiveModel trashReceiveModel =
                                    trashReceiveProvider.trashReceiveByPartner[index];
                                return TrashReceiveLisTile(trashReceiveModel: trashReceiveModel);
                              }),
                        )
                      : Center(
                          child: CustomText(
                              text: 'Belum Ada Pilihan Jenis Sampah',
                              size: 16.0,
                              weight: FontWeight.w600)),
                  Container(
                    height: 55.0,
                    padding: EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      color: (userProvider.userModel.carTrash.isEmpty) ? grey : green,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: CustomText(
                            text: 'LANJUT',
                            size: 16.0,
                            color: white,
                            weight: FontWeight.w700),
                      ),
                      onPressed: (userProvider.userModel.carTrash.isEmpty) ? null : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckouTrash(partnerModel: widget.partner),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}