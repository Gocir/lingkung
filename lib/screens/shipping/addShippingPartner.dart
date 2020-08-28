import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// Firebase
import 'package:firebase_storage/firebase_storage.dart';
// Services
import 'package:lingkung/services/productService.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class AddShippingPartner extends StatefulWidget {
  @override
  _AddShippingPartnerState createState() => _AddShippingPartnerState();
}

class _AddShippingPartnerState extends State<AddShippingPartner> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  ProductServices _productService = ProductServices();

  String name = '';
  File _image;

  bool isCheck = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldStateKey,
            appBar: AppBar(
              backgroundColor: blue,
              elevation: 0.0,
              iconTheme: IconThemeData(color: white),
              title: CustomText(
                text: 'Tambah Produk',
                color: white,
                size: 18.0,
                weight: FontWeight.w600,
              ),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlineButton(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 2.5),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      1);
                                },
                                child: _displayChild()),
                          ),
                        ],
                      ),
                      TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              hintText: 'Apa nama brand jasa pengiriman?',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              labelText: 'Nama Brand Jasa',
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
                              name = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Masukkan nama brand jasa'
                              : (value.length > 100)
                                  ? 'Batas maksimal karakter 100'
                                  : null),
                      Container(
                          height: 45.0,
                          margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
                          child: RaisedButton(
                            color: green,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: CustomText(
                                  text: 'SIMPAN',
                                  color: white,
                                  weight: FontWeight.w700),
                            ),
                            onPressed: () {
                              save();
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    setState(() => _image = tempImg);
  }

  Widget _displayChild() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image,
        fit: BoxFit.contain,
        width: double.infinity,
      );
    }
  }

  void save() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);

      if (_image != null && name != null) {
        String imageUrl;

        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture =
            "JP${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task = storage.ref().child(picture).putFile(_image);
        StorageTaskSnapshot snapshots =
            await task.onComplete.then((snapshot) => snapshot);
        task.onComplete.then((snapshot) async {
          imageUrl = await snapshots.ref.getDownloadURL();
          _productService.addProduct({
            "images": imageUrl,
            "name": name,
            "isCheck": false,
          });
          setState(() => loading = false);
          Navigator.pop(context);
        });
      } else {
        setState(() => loading = false);
      }
    }
  }
}
