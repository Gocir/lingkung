import 'package:flutter/material.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/screens/trashBank/trashBankDetail.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

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
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrashBankDetail(
                            partner: partnerProvider.partners[index]),
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
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${partnerProvider.partners[index].image}"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0),
                              ]),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                text:
                                    "BS. ${partnerProvider.partners[index].name}",
                                size: 16,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(height: 5.0),
                              CustomText(
                                  text:
                                      '${partnerProvider.partners[index].address}',
                                  size: 10,
                                  color: grey,
                                  weight: FontWeight.w500)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : Loading();
  }
}
