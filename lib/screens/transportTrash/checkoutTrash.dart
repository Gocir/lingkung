import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/models/partnerModel.dart';
import 'package:lingkung/providers/junkSalesProvider.dart';
import 'package:lingkung/providers/addressProvider.dart';
import 'package:lingkung/providers/trashCartProvider.dart';
import 'package:lingkung/screens/address/addressList.dart';
import 'package:lingkung/screens/transportTrash/junkSalesStatus.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/widgets/trashCartCard.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:lingkung/models/trashCartModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/services/trashCartService.dart';

class CheckoutTrash extends StatefulWidget {
  final UserModel userModel;
  final PartnerModel partnerModel;
  final List<String> checkList;
  final List<TrashReceiveModel> trashReceiveModel;
  CheckoutTrash(
      {this.trashReceiveModel,
      this.partnerModel,
      this.userModel,
      this.checkList});
  @override
  _CheckoutTrashState createState() => _CheckoutTrashState();
}

class _CheckoutTrashState extends State<CheckoutTrash> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  TrashCartServices _trashCartService = TrashCartServices();

  AddressModel addressModel;
  final picker = ImagePicker();
  File _trashImage;
  int _earth = 100;
  int _deliveryCosts = 6000;
  String locationBenchmarks = "";
  int profitTotal = 0;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    final trashCartProvider = Provider.of<TrashCartProvider>(context);
    addressProvider.loadUserAddress(widget.userModel.id);
    trashCartProvider.loadTrashCartByUser(widget.userModel.id);
    trashCartProvider.getProfit(widget.userModel.id);
    trashCartProvider.getProfitTotal(
        trashCartProvider.profit, _earth, _deliveryCosts);

    // profitTotal = trashCartProvider.profit - _earth - _deliveryCosts;

    return loading
        ? Loading()
        : SafeArea(
            top: false,
            child: Scaffold(
              key: _scaffoldStateKey,
              appBar: AppBar(
                iconTheme: IconThemeData(color: white),
                backgroundColor: blue,
                titleSpacing: 0,
                title: CustomText(
                  text: 'BS. ${widget.partnerModel.businessName}',
                  size: 18.0,
                  color: white,
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: 'Antar Ke',
                      size: 16.0,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 5.0),
                    Card(
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.my_location,
                                  size: 30.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: CustomText(
                                    text: (addressModel == null)
                                        ? (addressProvider.userAddress.isEmpty)
                                            ? 'Atur alamat disini >>'
                                            : '${addressProvider.userAddress[0].addressDetail}, ${addressProvider.userAddress[0].subDistrict}, ${addressProvider.userAddress[0].city}, ${addressProvider.userAddress[0].province} ${addressProvider.userAddress[0].postalCode}'
                                        : '${addressModel.addressDetail}, ${addressModel.subDistrict}, ${addressModel.city}, ${addressModel.province} ${addressModel.postalCode}',
                                    line: 2,
                                    over: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                InkWell(
                                  onTap: () {
                                    _addressModalBottomSheet(context);
                                  },
                                  child: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: black,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(10.0),
                                counterStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.0,
                                  color: black,
                                ),
                                hintText:
                                    'Tambahkan catatan alamat penjemputan',
                                hintStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.0,
                                ),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blue),
                                ),
                              ),
                              onChanged: (str) {
                                setState(() {
                                  locationBenchmarks = str;
                                });
                              },
                              validator: (value) => (value.length > 100)
                                  ? 'Batas maksimal karakter 50'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: 'Rincian Sampah',
                          size: 16.0,
                          weight: FontWeight.w700,
                        ),
                        InkWell(
                          child: CustomText(
                            text: 'Tambah',
                            color: green,
                            weight: FontWeight.w600,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 5.0),
                    (trashCartProvider.trashCartByUser.isNotEmpty)
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: trashCartProvider.trashCartByUser.length,
                            itemBuilder: (_, index) {
                              TrashCartModel itemCart =
                                  trashCartProvider.trashCartByUser[index];
                              return TrashCartCard(
                                  itemCart: itemCart,
                                  userModel: widget.userModel,
                                  scaffold: _scaffoldStateKey,
                                  checkList: widget.checkList);
                            },
                          )
                        : Center(
                            child:
                                CustomText(text: 'Tidak ada sampah di gerobak'),
                          ),
                    SizedBox(height: 16.0),
                    CustomText(
                      text: 'Detail Pendapatan',
                      size: 16.0,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CustomText(
                                      text: "Keuntungan (estimasi)",
                                      size: 12.0,
                                    ),
                                    CustomText(
                                      text: NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp',
                                              decimalDigits: 0)
                                          .format(
                                              (trashCartProvider.profit == null)
                                                  ? 0
                                                  : trashCartProvider.profit),
                                      size: 12.0,
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CustomText(
                                      text: "Untuk Bumi",
                                      size: 12.0,
                                    ),
                                    CustomText(
                                      text: NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp',
                                              decimalDigits: 0)
                                          .format(_earth),
                                      size: 12.0,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CustomText(
                                      text: "Jasa Pengantaran",
                                      size: 12.0,
                                    ),
                                    CustomText(
                                      text: NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp',
                                              decimalDigits: 0)
                                          .format(_deliveryCosts),
                                      size: 12.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomText(
                                  text: "Total Keuntungan",
                                  weight: FontWeight.w500,
                                ),
                                CustomText(
                                  text: NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp',
                                          decimalDigits: 0)
                                      .format(trashCartProvider.profitTotal),
                                  color: Colors.red,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    CustomText(
                      text: 'Metode Pembayaran',
                      size: 16.0,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 5.0),
                    Card(
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/icons/balanceColor.png"),
                            SizedBox(width: 10.0),
                            CustomText(
                              text: 'Tunai',
                              weight: FontWeight.w600,
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    CustomText(
                        text: 'Unggah Foto Sampah',
                        size: 16.0,
                        weight: FontWeight.w700),
                    SizedBox(height: 5.0),
                    widgetTrashImage(),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                height: 80.0,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 48.0,
                      child: FlatButton(
                        color: (trashCartProvider.profitTotal.isNegative)
                            ? grey
                            : green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Angkut Sekarang',
                            size: 16.0,
                            color: white,
                            weight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          save();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void save() async {
    final addressProvider = Provider.of<AddressProvider>(
      context,
      listen: false,
    );
    final junkSalesProvider = Provider.of<JunkSalesProvider>(
      context,
      listen: false,
    );
    final trashCartProvider = Provider.of<TrashCartProvider>(
      context,
      listen: false,
    );
    setState(() {
      loading = true;
    });
    if (addressProvider.userAddress.isEmpty) {
      _addressModalBottomSheet(context);
      setState(() {
        loading = false;
      });
    } else if (_trashImage == null) {
      _notCompleteBottomSheet(context);
      setState(() {
        loading = false;
      });
    } else if (trashCartProvider.profitTotal.isNegative ||
        trashCartProvider.profitTotal == null) {
      _minusBottomSheet(context);
      setState(() {
        loading = false;
      });
    } else {
      var uuid = Uuid();
      String junkSalesId = uuid.v4();
      String imageUrl;

      final FirebaseStorage storage = FirebaseStorage.instance;
      final String picture =
          "TI${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
      StorageUploadTask task =
          storage.ref().child(picture).putFile(_trashImage);
      StorageTaskSnapshot snapshots =
          await task.onComplete.then((snapshot) => snapshot);
      task.onComplete.then(
        (snapshot) async {
          imageUrl = await snapshots.ref.getDownloadURL();

          bool value = await junkSalesProvider.addJunkSales(
            junkSalesId: junkSalesId,
            userId: widget.userModel.id,
            userName: widget.userModel.name,
            partnerId: widget.partnerModel.id,
            businessName: widget.partnerModel.businessName,
            courierId: "",
            courierName: "",
            startPoint: (addressModel == null)
                ? '${addressProvider.userAddress[0].addressDetail}, ${addressProvider.userAddress[0].subDistrict}, ${addressProvider.userAddress[0].city}, ${addressProvider.userAddress[0].province} ${addressProvider.userAddress[0].postalCode}'
                : '${addressModel.addressDetail}, ${addressModel.subDistrict}, ${addressModel.city}, ${addressModel.province} ${addressModel.postalCode}',
            destination: widget.partnerModel.addressModel.addressDetail,
            locationBenchmarks: locationBenchmarks,
            trashCartModel: trashCartProvider.trashCartByUser,
            profitEstimate: trashCartProvider.profit,
            earth: _earth,
            deliveryCosts: _deliveryCosts,
            profitTotal: profitTotal,
            paymentMethod: "Cash",
            trashImage: imageUrl,
          );

          if (value) {
            for (int i = 0; i < trashCartProvider.trashCartByUser.length; i++) {
              await _trashCartService.deleteFromCart(
                  userId: widget.userModel.id,
                  docId: trashCartProvider.trashCartByUser[i].id);
            }
            print("Removed All Success!");
          }
          print('saved!');
          setState(() {
            loading = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => JunkSalesStatus(
                userModel: widget.userModel,
                junkSalesId: junkSalesId,
              ),
            ),
          );
        },
      );
    }
  }

  void _addressModalBottomSheet(context) {
    final addressProvider = Provider.of<AddressProvider>(
      context,
      listen: false,
    );
    addressProvider.loadAddress();
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: black),
              ),
              title: CustomText(
                text: 'Daftar Alamat',
                color: black,
                size: 18.0,
                weight: FontWeight.w600,
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddressList(userModel: widget.userModel),
                    ),
                  );
                },
                child: CustomText(
                  text: 'Tambah',
                  color: green,
                  weight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              indent: 16.0,
              endIndent: 16.0,
            ),
            (addressProvider.userAddress.isNotEmpty)
                ? Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: addressProvider.userAddress.length,
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            isThreeLine: true,
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                addressModel =
                                    addressProvider.userAddress[index];
                              });
                            },
                            title: CustomText(
                              text: addressProvider
                                  .userAddress[index].addressLabel,
                              size: 12.0,
                              weight: FontWeight.w600,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(
                                  text: addressProvider
                                      .userAddress[index].recipientsName,
                                  weight: FontWeight.w700,
                                ),
                                SizedBox(height: 5.0),
                                CustomText(
                                  text: addressProvider
                                      .userAddress[index].phoneNumber,
                                  size: 12.0,
                                ),
                                SizedBox(height: 5.0),
                                CustomText(
                                  text:
                                      '${addressProvider.userAddress[index].addressDetail}, ${addressProvider.userAddress[index].subDistrict}, ${addressProvider.userAddress[index].city}, ${addressProvider.userAddress[index].province}, ${addressProvider.userAddress[index].postalCode}',
                                  size: 12.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: CustomText(
                        text: 'Alamatmu masih kosong. Tambahkan dulu, yuk!',
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }

  void _notCompleteBottomSheet(context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 186.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Data Anda belum lengkap. Lengkapi dulu, yuk.',
                      size: 18.0,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 45,
                      child: FlatButton(
                        color: green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'OKE',
                            color: white,
                            size: 16.0,
                            weight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _minusBottomSheet(context) {
    final cartProvider = Provider.of<TrashCartProvider>(
      context,
      listen: false,
    );
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 2.2,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/verifailed.png"),
                  ),
                  SizedBox(height: 16.0),
                  CustomText(
                    text: 'Tidak ada keuntungan untuk-mu?',
                    size: 18.0,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(
                    text:
                        'Tambah lagi estimasi berat sampah yang ingin di jual, yuk!',
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 48,
                          child: OutlineButton(
                            color: green,
                            highlightedBorderColor: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            borderSide: BorderSide(
                              color: green,
                              width: 2.5,
                            ),
                            child: CustomText(
                              text: 'BATALKAN',
                              color: green,
                              size: 16.0,
                              weight: FontWeight.w700,
                            ),
                            onPressed: () async {
                              setState(() => loading = true);
                              for (int i = 0;
                                  i < cartProvider.trashCartByUser.length;
                                  i++) {
                                await _trashCartService.deleteFromCart(
                                    userId: widget.userModel.id,
                                    docId: cartProvider.trashCartByUser[i].id);
                              }
                              print("Removed All Success!");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                              _scaffoldStateKey.currentState.showSnackBar(
                                SnackBar(
                                  content:
                                      CustomText(text: "Removed All Success!"),
                                ),
                              );
                              setState(() => loading = false);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Container(
                          height: 48,
                          child: FlatButton(
                            color: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CustomText(
                              text: 'TAMBAH',
                              color: white,
                              size: 16.0,
                              weight: FontWeight.w700,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future _getTrashImage() async {
    final pickedImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _trashImage = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget widgetTrashImage() {
    if (_trashImage == null) {
      return InkWell(
        onTap: () {
          _getTrashImage();
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey[200],
              width: 1.5,
            ),
          ),
          child: Icon(Icons.add),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          _getTrashImage();
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.file(
              _trashImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }
}
