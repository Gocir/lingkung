import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/addressProvider.dart';
import 'package:provider/provider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class UpdateAddress extends StatefulWidget {
  final UserModel userModel;
  final AddressModel addressModel;
  UpdateAddress({this.addressModel, this.userModel});
  @override
  _UpdateAddressState createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController addressLabelCtrl;
  TextEditingController recipientsNameCtrl;
  TextEditingController phoneNumberCtrl;
  TextEditingController provinceCtrl;
  TextEditingController cityCtrl;
  TextEditingController subDistrictCtrl;
  TextEditingController postalCodeCtrl;
  TextEditingController addressDetailCtrl;

  String addressLabel;
  String recipientsName;
  String phoneNumber;
  String province;
  String city;
  String subDistrict;
  String postalCode;
  String addressDetail;
  bool isPrimary;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    addressLabel = widget.addressModel.addressLabel;
    recipientsName = widget.addressModel.recipientsName;
    phoneNumber = widget.addressModel.phoneNumber;
    province = widget.addressModel.province;
    city = widget.addressModel.city;
    subDistrict = widget.addressModel.subDistrict;
    postalCode = widget.addressModel.postalCode.toString();
    addressDetail = widget.addressModel.addressDetail;
    isPrimary = widget.addressModel.isPrimary;

    addressLabelCtrl =
        TextEditingController(text: widget.addressModel.addressLabel);
    recipientsNameCtrl =
        TextEditingController(text: widget.addressModel.recipientsName);
    phoneNumberCtrl =
        TextEditingController(text: widget.addressModel.phoneNumber);
    provinceCtrl = TextEditingController(text: widget.addressModel.province);
    cityCtrl = TextEditingController(text: widget.addressModel.city);
    subDistrictCtrl =
        TextEditingController(text: widget.addressModel.subDistrict);
    postalCodeCtrl =
        TextEditingController(text: widget.addressModel.postalCode.toString());
    addressDetailCtrl =
        TextEditingController(text: widget.addressModel.addressDetail);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            top: false,
            child: Scaffold(
              key: _scaffoldStateKey,
              backgroundColor: white,
              appBar: AppBar(
                  backgroundColor: white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: black),
                  // title: CustomText(
                  //     text: 'Alamat Baru',
                  //     size: 18.0,
                  //     weight: FontWeight.w600),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.help_outline_outlined, color: black),
                        onPressed: () {})
                  ]),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                            text: 'Label Alamat', weight: FontWeight.w600),
                        TextFormField(
                            controller: addressLabelCtrl,
                            textCapitalization: TextCapitalization.words,
                            style:
                                TextStyle(fontFamily: "Poppins", color: black),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 8.0),
                                counterStyle: TextStyle(
                                    fontFamily: "Poppins", color: black),
                                hintText: 'Contoh: Rumah, Apartement, Kos, dll',
                                hintStyle: TextStyle(fontFamily: "Poppins"),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: blue))),
                            onChanged: (str) {
                              setState(() {
                                addressLabel = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Masukkan label alamat'
                                : null),
                        SizedBox(height: 16.0),
                        CustomText(
                            text: 'Nama Penerima', weight: FontWeight.w600),
                        TextFormField(
                            controller: recipientsNameCtrl,
                            textCapitalization: TextCapitalization.words,
                            style:
                                TextStyle(fontFamily: "Poppins", color: black),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 8.0),
                                counterStyle: TextStyle(
                                    fontFamily: "Poppins", color: black),
                                hintText: 'Isi dengan nama penerima',
                                hintStyle: TextStyle(fontFamily: "Poppins"),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: blue))),
                            onChanged: (str) {
                              setState(() {
                                recipientsName = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Masukkan nama penerima'
                                : null),
                        SizedBox(height: 16.0),
                        CustomText(text: 'Nomor HP', weight: FontWeight.w600),
                        TextFormField(
                            controller: phoneNumberCtrl,
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(12),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: black,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 8.0),
                                counterStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    color: black,
                                    fontWeight: FontWeight.normal),
                                hintText: 'Contoh: 081234567890',
                                hintStyle: TextStyle(fontFamily: "Poppins"),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: blue))),
                            onChanged: (str) {
                              setState(() {
                                phoneNumber = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Masukkan Nomor Telepon Penerima'
                                : (value.length > 12)
                                    ? 'Batas Maksimal Nomor Telepon adalah 12'
                                    : null),
                        SizedBox(height: 16.0),
                        CustomText(text: 'Provinsi', weight: FontWeight.w600),
                        TextFormField(
                            controller: provinceCtrl,
                            textCapitalization: TextCapitalization.words,
                            style:
                                TextStyle(fontFamily: "Poppins", color: black),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 8.0),
                                counterStyle: TextStyle(
                                    fontFamily: "Poppins", color: black),
                                hintText: 'Contoh: Jawa Barat',
                                hintStyle: TextStyle(fontFamily: "Poppins"),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: blue))),
                            onChanged: (str) {
                              setState(() {
                                province = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Masukkan nama provinsi'
                                : null),
                        SizedBox(height: 16.0),
                        CustomText(
                            text: 'Kota/Kabupaten', weight: FontWeight.w600),
                        TextFormField(
                            controller: cityCtrl,
                            textCapitalization: TextCapitalization.words,
                            style:
                                TextStyle(fontFamily: "Poppins", color: black),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 8.0),
                                counterStyle: TextStyle(
                                    fontFamily: "Poppins", color: black),
                                hintText: 'Contoh: Kabupaten Bekasi',
                                hintStyle: TextStyle(fontFamily: "Poppins"),
                                errorStyle: TextStyle(fontFamily: "Poppins"),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: blue))),
                            onChanged: (str) {
                              setState(() {
                                city = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Masukkan nama kota/kabupaten'
                                : null),
                        SizedBox(height: 16.0),
                        CustomText(text: 'Kecamatan', weight: FontWeight.w600),
                        TextFormField(
                            controller: subDistrictCtrl,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: black,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0),
                              counterStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: black,
                              ),
                              hintText: 'Contoh: Kecamatan Babelan',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              errorStyle: TextStyle(fontFamily: "Poppins"),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blue),
                              ),
                            ),
                            onChanged: (str) {
                              setState(() {
                                subDistrict = str;
                              });
                            },
                            validator: (value) => (value.isEmpty)
                                ? 'Masukkan nama kecamatan'
                                : null),
                        SizedBox(height: 16.0),
                        CustomText(
                          text: 'Kode POS',
                          weight: FontWeight.w600,
                        ),
                        TextFormField(
                          controller: postalCodeCtrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(5),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(bottom: 8.0),
                            counterStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: black,
                            ),
                            hintText: 'Contoh: 17510',
                            hintStyle: TextStyle(fontFamily: "Poppins"),
                            errorStyle: TextStyle(fontFamily: "Poppins"),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: blue),
                            ),
                          ),
                          onChanged: (str) {
                            setState(() {
                              postalCode = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Masukkan kode POS'
                              : (value.length > 5)
                                  ? 'Batas Maksimal karakter adalah 5'
                                  : null,
                        ),
                        SizedBox(height: 16.0),
                        CustomText(
                          text: 'Alamat Detail',
                          weight: FontWeight.w600,
                        ),
                        TextFormField(
                          controller: addressDetailCtrl,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(bottom: 8.0),
                            counterStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: black,
                            ),
                            hintText: 'Contoh: Nama gedung, jalan & lainnya...',
                            hintStyle: TextStyle(fontFamily: "Poppins"),
                            errorStyle: TextStyle(fontFamily: "Poppins"),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: blue),
                            ),
                          ),
                          onChanged: (str) {
                            setState(() {
                              addressDetail = str;
                            });
                          },
                          validator: (value) =>
                              (value.isEmpty) ? 'Masukkan detail alamat' : null,
                        ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     CustomText(
                        //       text: 'Jadikan Sebagai Alamat Utama',
                        //     ),
                        //     CupertinoSwitch(
                        //         value: isPrimary,
                        //         onChanged: (bool value) {
                        //           setState(() {
                        //             isPrimary = value;
                        //           });
                        //         },
                        //         activeColor: blue),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                height: 80.0,
                padding: EdgeInsets.all(16.0),
                child: FlatButton(
                  color: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CustomText(
                    text: 'SIMPAN',
                    color: white,
                    weight: FontWeight.w700,
                  ),
                  onPressed: () {
                    save();
                  },
                ),
              ),
            ),
          );
  }

  void save() async {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      await addressProvider.updateAddress(
          id: widget.addressModel.id,
          userId: widget.userModel.id,
          addressLabel: addressLabel,
          recipientsName: recipientsName,
          phoneNumber: phoneNumber,
          province: province,
          city: city,
          subDistrict: subDistrict,
          postalCode: int.parse(postalCode),
          addressDetail: addressDetail);

      print("Address Saved!");
      addressProvider.loadAddress();
      setState(() => loading = false);
      Navigator.pop(context);
    } else {
      print("Address failed to Save!");
      _emptyModalBottomSheet(context);
      setState(() => loading = false);
    }
  }

  void _emptyModalBottomSheet(context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.width / 2.2,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/verifailed.png")),
                  SizedBox(height: 16.0),
                  CustomText(
                    text: 'Tunggu! Ada data yang kosong',
                    size: 18.0,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(
                    text:
                        'Kamu tidak dapat menyimpan bila datamu kosong. Yuk, lengkapi datamu!',
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: FlatButton(
                      color: green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: CustomText(
                          text: 'OKE',
                          color: white,
                          size: 16.0,
                          weight: FontWeight.w700),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
