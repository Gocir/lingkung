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

class TrashOrderComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final junkSalesProvider = Provider.of<JunkSalesProvider>(context);
    final partnerProvider = Provider.of<PartnerProvider>(context);
    junkSalesProvider.loadUserJunkSales(userProvider.userModel?.id);

    return (junkSalesProvider.userJunkSalesComplete.isNotEmpty)
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            itemCount: junkSalesProvider.userJunkSalesComplete.length,
            itemBuilder: (_, index) {
              junkSalesProvider.loadListTrash(
                  junkSalesProvider.userJunkSalesComplete[index].id);
              partnerProvider.loadSinglePartner(
                  junkSalesProvider.userJunkSales[index].partnerId);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JunkSalesStatus(
                          junkSalesId: junkSalesProvider
                              .userJunkSalesComplete[index].id),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: CachedNetworkImage(
                      imageUrl: partnerProvider.partnerModel?.image.toString(),
                      imageBuilder: (_, imageProvider) => CircleAvatar(
                          maxRadius: 16, backgroundImage: imageProvider),
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
                          text: 'Pesanan Selesai',
                          color: green,
                          weight: FontWeight.w700,
                        ),
                        CustomText(
                          text: (partnerProvider.partnerModel?.businessName ==
                                  null)
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
                            text: '${junkSalesProvider.listTrash.length} Jenis',
                          ),
                          TextSpan(text: ' º '),
                          TextSpan(
                            text:
                                '${junkSalesProvider.userJunkSalesComplete[index].directionModel.startPoint}',
                          ),
                        ],
                      ),
                    ),
                    trailing: CustomText(
                      text: '12 Nov',
                      size: 12.0,
                      color: grey,
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
          child: CustomText(
              text: 'Belum Ada Pesanan yang Selesai',
              weight: FontWeight.w600,
            ),
        );
  }
}
