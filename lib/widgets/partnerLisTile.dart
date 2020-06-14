// import "package:flutter/material.dart";

// class BankLisTile extends StatelessWidget {
//   final String imagePath;
//   final String bankName;
//   final String address;

//   BankLisTile({this.imagePath, this.bankName, this.address});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Flexible(
//             flex: 1,
//             child: Container(
//               width: 140.0,
//               margin: EdgeInsets.all(5.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 image: DecorationImage(
//                     alignment: Alignment.centerLeft,
//                     image: AssetImage("$imagePath"),
//                     fit: BoxFit.fill),
//               ),
//             ),
//           ),
//           Flexible(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   '$bankName',
//                   style: TextStyle(
//                       fontFamily: "Poppins",
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   '$address',
//                   style: TextStyle(
//                       fontFamily: "Poppins",
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/screens/trashBank/trashBankDetail.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class PartnerLisTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final partnerProvider = Provider.of<PartnerProvider>(context);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: partnerProvider.partners.length,
        itemBuilder: (_, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              onTap: (){
              print("BS. ${partnerProvider.partners[index].id}");
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrashBankDetail(partner: partnerProvider.partners[index]),
                        ));
              },
              title: CustomText(
                text: "BS. ${partnerProvider.partners[index].name}",
                size: 16,
                color: black,
                weight: FontWeight.w600,
              ),
              subtitle: CustomText(
                text: '${partnerProvider.partners[index].address}',
                size: 10,
                color: grey,
                weight: FontWeight.w500,
              ),
            ),
          );
        });
  }
}
