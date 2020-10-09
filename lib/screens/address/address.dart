import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  
  bool loading = false;
  bool isPrimary = false;
  String addressLabel = '';
  String recipientsName = '';
  String phoNumber = '';
  String province = '';
  String city = '';
  String subDistrict = '';
  String posCode = '';
  String addressDetail = '';
  String baseUrl = "http://192.168.10.232/news_server/index.php/Api/";
  String valProvince;
  String valCity;
  List<dynamic> dataProvince = List();
  List<dynamic> dataCity = List();


  void getProvince() async {
    final response = await http.get(baseUrl + "getProvince1"); //untuk melakukan request ke webservice
    var listData = jsonDecode(response.body); //lalu kita decode hasil datanya
    setState(() {
      dataProvince = listData; // dan kita set kedalam variable dataProvince
    });
    print("Data Province : $listData");
  }


  void getCity(String idProvince)async{
    final response = await http.post(baseUrl + "getCity",body: {
      'id' : idProvince
    });

    var listData = jsonDecode(response.body);
    setState(() {
      dataCity = listData;
    });
    print("Data City : $listData");
  }


  @override
  void initState() {
    // T0D0: implement initState
    super.initState();
    getProvince();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldStateKey,
            // extendBodyBehindAppBar: true,
            // resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: blue,
              iconTheme: IconThemeData(color: white),
              title: CustomText(
                text: 'Alamat Baru',
                color: white,
                size: 18.0,
                weight: FontWeight.w600,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // UpdatePinpoint(),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Cth: Rumah, Apartement, Kos, dll',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Label Alamat',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              // maxLength: 100,
                              onChanged: (String str) {
                                setState(() {
                                  addressLabel = str;
                                });
                              },
                              validator: (value) =>
                                  (value.isEmpty) ? 'Masukkan label alamat' : null),
                          TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Isi dengan nama penerima',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Nama Penerima',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  recipientsName = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan nama penerima'
                                  : null),
                          TextFormField(
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Cth: 81234567890',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'No. Telepon',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  prefixText: '+62 ',
                                  prefixStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: yellow,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  phoNumber = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan Nomor Telepon Penerima'
                                  : (value.length > 11)
                                      ? 'Batas Maksimal Nomor Telepon adalah 11'
                                      : null),
                          TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Isi dengan nama provinsi',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Provinsi',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  province = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan nama provinsi'
                                  : null),
                          TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Isi dengan nama kota/kabupaten',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Kota/Kabupaten',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  city = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan nama kota/kabupaten'
                                  : null),
                          TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Isi dengan nama kecamatan',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Kecamatan',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  subDistrict = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan nama kecamatan'
                                  : null),
                          TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Isi dengan kode POS',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Kode POS',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  posCode = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan kode POS'
                                  : (value.length > 5)
                                      ? 'Batas Maksimal karakter adalah 5'
                                      : null),
                          TextFormField(
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Masukkan Jalan, Gedung, Nomor, RT/RW',
                                  hintStyle: TextStyle(fontFamily: "Poppins"),
                                  labelText: 'Alamat Detail',
                                  labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  errorStyle: TextStyle(fontFamily: "Poppins"),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: yellow))),
                              onChanged: (String str) {
                                setState(() {
                                  addressDetail = str;
                                });
                              },
                              validator: (value) => (value.isEmpty)
                                  ? 'Masukkan detail alamat'
                                  : null),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CustomText(
                                text: 'Jadikan Sebagai Alamat Utama',
                                weight: FontWeight.w600,
                              ),
                              CupertinoSwitch(
                                  value: isPrimary,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isPrimary = value;
                                    });
                                  },
                                  activeColor: blue),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Container(
                              height: 45.0,
                              child: RaisedButton(
                                color: green,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: CustomText(
                                      text: 'SIMPAN',
                                      color: white,
                                      weight: FontWeight.w700),
                                ),
                                onPressed: () async {
                                  // save();
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    bool value = await userProvider.addAddress(
                                        addressLabel: addressLabel,
                                        recipientsName: recipientsName,
                                        phoNumber: int.parse(phoNumber),
                                        province: province,
                                        city: city,
                                        subDistrict: subDistrict,
                                        posCode: int.parse(posCode),
                                        addressDetail: addressDetail);
                                    if (value) {
                                      print("Address Saved!");
                                      _scaffoldStateKey.currentState
                                          .showSnackBar(SnackBar(
                                              content: CustomText(
                                        text: "Saved!",
                                        color: white,
                                        weight: FontWeight.w600,
                                      )));
                                      userProvider.reloadUserModel();
                                      setState(() {
                                        loading = false;
                                      });
                                      Navigator.pop(context);
                                    } else {
                                      print("Address failed to Save!");
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                    setState(() => loading = false);
                                  } else {
                                    setState(() => loading = false);
                                  }
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
