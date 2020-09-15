import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/screens/trashBank/trashBankDetail.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class PartnerLisTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final partnerProvider = Provider.of<PartnerProvider>(context);
    return (partnerProvider.partners.isNotEmpty)
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            itemCount: partnerProvider.partners.length,
            itemBuilder: (_, index) {
              PartnerModel partnerModel = partnerProvider.partners[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrashBankDetail(
                            partner: partnerModel),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CachedNetworkImage(
                            imageUrl: partnerModel.image.toString(),
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
                                    ]))),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                text: "BS. ${partnerModel.name}",
                                size: 16,
                                line: 2,
                                over: TextOverflow.fade,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(height: 5.0),
                              CustomText(
                                  text: partnerModel.address,
                                  size: 10,
                                  color: grey,
                                  weight: FontWeight.w500)
                            ]))
                    ]))));
            })
        : Center(
            child: CustomText(
                text: 'Belum Ada Mitra Pengelola',
                size: 16.0,
                weight: FontWeight.w600));
  }
}
