import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/junkSalesProvider.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/screens/transportTrash/junkSalesStatus.dart';

class TrashOrderProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final junkSalesProvider = Provider.of<JunkSalesProvider>(context);
    final partnerProvider = Provider.of<PartnerProvider>(context);
    junkSalesProvider.loadUserJunkSales(userProvider.userModel?.id);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8.0),
        itemCount: junkSalesProvider.userJunkSales.length,
        itemBuilder: (_, index) {
          junkSalesProvider
              .loadListTrash(junkSalesProvider.userJunkSales[index].id);
          partnerProvider.loadSinglePartner(
              junkSalesProvider.userJunkSales[index].partnerId);
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JunkSalesStatus(
                      junkSalesId: junkSalesProvider.userJunkSales[index].id),
                ),
              );
            },
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: CachedNetworkImage(
                  imageUrl: partnerProvider.partnerModel?.image.toString(),
                  imageBuilder: (_, imageProvider) =>
                      CircleAvatar(maxRadius: 16, backgroundImage: imageProvider),
                  placeholder: (_, url) => CircleAvatar(
                    maxRadius: 16,
                    backgroundColor: Colors.grey[200],
                    child: SpinKitThreeBounce(
                      color: black,
                      size: 10.0,
                    ),
                  ),
                  errorWidget: (_, url, error) => CircleAvatar(
                    maxRadius: 16,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: (junkSalesProvider.userJunkSales[index].status == "Start Orders")
                  ? 'Lagi Cari Scavanger' :
                      (junkSalesProvider.userJunkSales[index].status == "Receive Orders")
                  ? 'Lagi ke tempatmu'
                  : (junkSalesProvider.userJunkSales[index].status == "Take Orders")
                      ? 'Lagi ambil sampahmu'
                      : (junkSalesProvider.userJunkSales[index].status == "Deliver Orders")
                          ? 'Lagi anter sampahmu'
                          : 'Lagi di tujuan akhir',
                      color: green,
                      weight: FontWeight.w700,
                    ),
                    CustomText(
                      text: (partnerProvider.partnerModel?.businessName == null)
                          ? 'Loading...'
                          : 'BS. ${partnerProvider.partnerModel?.businessName}',
                      size: 16.0,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                subtitle: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12.0,
                      color: grey,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${junkSalesProvider.listTrash.length} Jenis',
                      ),
                      TextSpan(text: ' º '),
                      TextSpan(
                        text:
                            '${junkSalesProvider.userJunkSales[index].directionModel.startPoint}',
                      ),
                    ],
                  ),
                ),
                trailing: Column(
                  children: <Widget>[
                    CustomText(
                      text: '15-25 menit',
                      size: 12.0,
                      color: grey,
                    ),
                    CustomText(
                      text: 'Estimasi waktu',
                      size: 12.0,
                      color: grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
