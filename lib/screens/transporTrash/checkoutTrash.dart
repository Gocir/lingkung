import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/screens/address/addressList.dart';
import 'package:lingkung/services/trashReceiveService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

import 'package:lingkung/models/cartTrashModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';

import 'package:lingkung/providers/userProvider.dart';

class CheckouTrash extends StatefulWidget {
  final PartnerModel partnerModel;
  final List<TrashReceiveModel> trashReceiveModel;
  CheckouTrash({this.trashReceiveModel, this.partnerModel});
  @override
  _CheckouTrashState createState() => _CheckouTrashState();
}

class _CheckouTrashState extends State<CheckouTrash> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  String collection = "users";
  TrashReceiveServices _trashReceiveService = TrashReceiveServices();
  AddressModel addressModel;
  bool loading = false;
  int _earth = 100;
  int _deliveryPrice = 5000;
  String addressNote = "";
  
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    int _profiTotal = userProvider.userModel.totalCartPriceTrash - _earth - _deliveryPrice;
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        title: CustomText(
          text: 'BS. ${widget.partnerModel.businessName}',
          size: 18.0,
          color: white,
        ),
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(text: 'Antar Ke', weight: FontWeight.w700),
              SizedBox(height: 5.0),
              Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Icon(Icons.my_location, size: 30.0, color: Colors.red),
                          SizedBox(width: 16.0),
                          Expanded(
                              child: CustomText(
                            text: (addressModel == null)
                                ? '${userProvider.userModel.addressModel[0].addressDetail}, ${userProvider.userModel.addressModel[0].subDistrict}, ${userProvider.userModel.addressModel[0].city}, ${userProvider.userModel.addressModel[0].province} ${userProvider.userModel.addressModel[0].posCode}'
                                : '${addressModel.addressDetail}, ${addressModel.subDistrict}, ${addressModel.city}, ${addressModel.province} ${addressModel.posCode}',
                            line: 2,
                            over: TextOverflow.ellipsis,
                          )),
                          SizedBox(width: 10.0),
                          InkWell(
                              onTap: () {
                                _addressModalBottomSheet(context);
                              },
                              child: Icon(Icons.more_vert))
                        ]),
                        SizedBox(height: 10.0),
                        TextFormField(
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(10.0),
                                counterStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12.0,
                                    color: black,
                                    fontWeight: FontWeight.normal),
                                hintText:
                                    'Tambahkan catatan alamat penjemputan',
                                hintStyle: TextStyle(
                                    fontFamily: "Poppins", fontSize: 12.0),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: yellow))),
                            // maxLength: 100,
                            onChanged: (String str) {
                              setState(() {
                                addressNote = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Berikan detail untuk mempermudah'
                                : (value.length > 100)
                                    ? 'Batas maksimal karakter 100'
                                    : null),
                      ],
                    ),
                  )),
              SizedBox(height: 16.0),
              CustomText(text: 'Rincian Sampah', weight: FontWeight.w700),
              SizedBox(height: 5.0),
              (userProvider.userModel.carTrash.isNotEmpty)
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: userProvider.userModel.carTrash.length,
                      itemBuilder: (_, index) {
                        CartTrashModel carTrashModel =
                            userProvider.userModel.carTrash[index];
                        return 
                        // CarTrashCard(
                        //     carTrashModel: carTrashModel,
                        //     scaffold: _scaffoldStateKey, index: index);
                        Card(
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
                      imageUrl: carTrashModel.image.toString(),
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
                              ]),
                          )),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        CustomText(
                            text: carTrashModel.name,
                            line: 2,
                            over: TextOverflow.fade,
                            weight: FontWeight.w500),
                        SizedBox(height: 5.0),
                        CustomText(
                            text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0)
                                    .format(carTrashModel.price) +
                                ' /Kg',
                            color: Colors.red),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                loading = true;
                                bool value =
                                    await userProvider.removeFromCarTrash(
                                        carTrash: carTrashModel);
                                if (value) {
                                  _trashReceiveService.updateTrashReceive({
                                    "id": carTrashModel.trashTypeId,
                                    "isCheck": false,
                                  });
                                  userProvider.reloadUserModel();
                                  print("Removed from Cart!");
                                  _scaffoldStateKey.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text("Removed from Cart!")));
                                  setState(() {
                                    loading = false;
                                  });
                                  return;
                                } else {
                                  print("ITEM WAS NOT REMOVED");
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            InkWell(
                                onTap: () {
                                  if (carTrashModel.weight != 1) {
                                    setState(() {
                                      // _firestore.collection(collection).document(userProvider.user.uid).updateData({
                                      //   "cartTrash.carTrashModel": carTrashModel.weight -= 1
                                      // });
                                    });
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
                            CustomText(text: carTrashModel.weight.toString() + ' Kg'),
                            SizedBox(width: 10.0),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                      // _firestore.collection(collection).where("cartTrash", arrayContains: carTrashModel).getDocuments().then((result) {
                                        
                                      // });
                                    });
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
                      })
                  : CustomText(
                      text: 'Pilih Jenis Sampah dulu, yuk!',
                      size: 16.0,
                      weight: FontWeight.w600),
              SizedBox(height: 16.0),
              CustomText(text: 'Detail Pendapatan', weight: FontWeight.w700),
              SizedBox(height: 5.0),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black12, width: 1.5),
                    color: Colors.grey[100],
                  ),
                  child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomText(
                                    text: "Keuntungan (estimasi)", size: 12.0),
                                CustomText(
                                    text: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(userProvider.userModel.totalCartPriceTrash),
                                    size: 12.0)
                              ]),
                          SizedBox(height: 5.0),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomText(text: "Untuk Bumi", size: 12.0),
                                CustomText(
                                    text: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(_earth),
                                    size: 12.0)
                              ]),
                          SizedBox(height: 5.0),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomText(text: "Jasa Pengantaran", size: 12.0),
                                CustomText(
                                    text: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(_deliveryPrice),
                                    size: 12.0)
                              ])
                        ])),
                    Divider(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CustomText(
                                  text: "Total Keuntungan",
                                  weight: FontWeight.w500),
                              CustomText(
                                  text: NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp',
                                          decimalDigits: 0)
                                      .format(_profiTotal),
                                  color: Colors.red,
                                  weight: FontWeight.w500)
                            ]))
                  ])),
              SizedBox(height: 16.0),
              CustomText(text: 'Metode Pembayaran', weight: FontWeight.w700),
              Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: <Widget>[
                        Image.asset("assets/icons/balanceColor.png"),
                        SizedBox(width: 10.0),
                        CustomText(text: 'Tunai', weight: FontWeight.w600),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down)
                      ])))
            ]),
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    // final userProvider = Provider.of<UserProvider>(context);
    // int _total = userProvider.userModel.totalCartPriceTrash + _earth;
    return Container(
        height: 77.0,
        color: white,
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Container(
            height: 45.0,
            child: RaisedButton(
              color: green,
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: CustomText(
                    text: 'Angkut Sekarang',
                    size: 16.0,
                    color: white,
                    weight: FontWeight.w700),
              ),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CheckouTrash(),
                //     ));
              },
            ),
          ),
        ]));
  }

  void _addressModalBottomSheet(context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              ListTile(
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: black)),
                  title: CustomText(
                    text: 'Daftar Alamat',
                    color: black,
                    size: 18.0,
                    weight: FontWeight.w600,
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressList(),
                          ));
                    },
                    child: CustomText(
                      text: 'Tambah',
                      color: blue,
                    ),
                  )),
              Divider(),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: userProvider.userModel.addressModel.length,
                    itemBuilder: (_, index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                              isThreeLine: true,
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  addressModel = userProvider
                                      .userModel.addressModel[index];
                                });
                              },
                              title: CustomText(
                                text: userProvider
                                    .userModel.addressModel[index].addressLabel,
                                size: 12.0,
                                weight: FontWeight.w600,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(
                                    text: userProvider.userModel
                                        .addressModel[index].recipientsName,
                                    weight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  CustomText(
                                    text: '62' +
                                        userProvider.userModel
                                            .addressModel[index].phoNumber
                                            .toString(),
                                    size: 12.0,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  CustomText(
                                    text:
                                        '${userProvider.userModel.addressModel[index].addressDetail}, ${userProvider.userModel.addressModel[index].subDistrict}, ${userProvider.userModel.addressModel[index].city}, ${userProvider.userModel.addressModel[index].province}, ${userProvider.userModel.addressModel[index].posCode}',
                                    size: 12.0,
                                  ),
                                ],
                              )));
                    }),
              ),
            ],
          );
        });
  }
}
