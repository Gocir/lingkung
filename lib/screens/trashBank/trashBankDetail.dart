import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/transportTrash/checkoutTrash.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/providers/trashReceiveProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/trashReceiveLisTile.dart';

class TrashBankDetail extends StatefulWidget {
  final UserModel userModel;
  final PartnerModel partner;
  TrashBankDetail({this.partner, this.userModel});

  @override
  _TrashBankDetailState createState() => _TrashBankDetailState();
}

class _TrashBankDetailState extends State<TrashBankDetail> {
  List<String> checkList = [];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final trashReceiveProvider = Provider.of<TrashReceiveProvider>(context);
    trashReceiveProvider.loadTrashReceiveByPartner(widget.partner.id);
    return SafeArea(
        top: false,
        child: Scaffold(
            body: CustomScrollView(
              // physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  snap: true,
                  floating: true,
                  iconTheme: IconThemeData(color: black),
                  leading: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: IconButton(
                          icon: Icon(Icons.help_outline, color: black),
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                  ],
                  backgroundColor: white,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CachedNetworkImage(
                      imageUrl: widget.partner.image.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: SpinKitThreeBounce(
                          color: black,
                          size: 20.0,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/noimage.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: 'BS. ${widget.partner.businessName}',
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.grey[200],
                              width: 1.5,
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.location_on, color: Colors.red),
                            title: CustomText(
                              text:
                                  '${widget.partner.addressModel.addressDetail}',
                              line: 4,
                              over: TextOverflow.fade,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        CustomText(
                            text: 'Jam Operasional', weight: FontWeight.w500),
                        SizedBox(height: 5.0),
                        Row(
                          children: <Widget>[
                            CustomText(
                              text: 'Setiap Hari pukul 06.00 - 21.00',
                              color: grey,
                              size: 12,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        Divider(height: 20.0),
                        CustomText(
                          text: 'Terima Jenis Sampah',
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      TrashReceiveModel trashReceiveModel =
                          trashReceiveProvider.trashReceiveByPartner[index];
                      return TrashReceiveLisTile(
                          trashReceiveModel: trashReceiveModel,
                          userModel: userProvider.userModel,
                          checkList: checkList);
                    },
                        childCount:
                            trashReceiveProvider.trashReceiveByPartner.length),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                height: 80.0,
                padding: EdgeInsets.all(16.0),
                child: FlatButton(
                    color: (checkList.isEmpty) ? grey : green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: CustomText(
                        text: 'LANJUT',
                        size: 16.0,
                        color: white,
                        weight: FontWeight.w700),
                    onPressed: () {
                      (checkList.isNotEmpty)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutTrash(
                                    partnerModel: widget.partner,
                                    userModel: widget.userModel,
                                    checkList: checkList),
                              ))
                          : print(checkList);
                      print(checkList);
                    }))));
  }
}
