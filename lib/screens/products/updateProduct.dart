import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// Firebase
import 'package:firebase_storage/firebase_storage.dart';
// Models
import 'package:lingkung/models/productModel.dart';
// Services
import 'package:lingkung/services/productService.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class UpdateProduct extends StatefulWidget {
  final ProductModel productModel;
  UpdateProduct({this.productModel});

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  ProductServices _productService = ProductServices();

  TextEditingController nameController;
  TextEditingController stockController;
  TextEditingController priceController;
  TextEditingController descriptionController;

  String name;
  String stock;
  String price;
  String description;

  bool loading = false;
  File _image1;
  // File _image2;
  // File _image3;

  @override
  void initState() {
    super.initState();
    name = widget.productModel.name;
    stock = widget.productModel.stock.toString();
    price = widget.productModel.price.toString();
    description = widget.productModel.description;

    nameController = TextEditingController(text: widget.productModel.name);
    stockController =
        TextEditingController(text: widget.productModel.stock.toString());
    priceController =
        TextEditingController(text: widget.productModel.price.toString());
    descriptionController =
        TextEditingController(text: widget.productModel.description);
  }

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
                                child: _displayChild1()),
                          ),
                          // Expanded(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: OutlineButton(
                          //         borderSide: BorderSide(
                          //             color: Colors.grey.withOpacity(0.5),
                          //             width: 2.5),
                          //         onPressed: () {
                          //           _selectImage(
                          //               ImagePicker.pickImage(
                          //                   source: ImageSource.gallery),
                          //               2);
                          //         },
                          //         child: _displayChild2()),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: OutlineButton(
                          //       borderSide: BorderSide(
                          //           color: Colors.grey.withOpacity(0.5),
                          //           width: 2.5),
                          //       onPressed: () {
                          //         _selectImage(
                          //             ImagePicker.pickImage(
                          //                 source: ImageSource.gallery),
                          //             3);
                          //       },
                          //       child: _displayChild3(),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      TextFormField(
                          controller: nameController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              hintText: 'Apa nama produk mu?',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              labelText: 'Nama Produk',
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
                              ? 'Masukkan nama produk'
                              : (value.length > 100)
                                  ? 'Batas maksimal karakter 100'
                                  : null),
                      TextFormField(
                          controller: stockController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              hintText: 'Berapa jumlah stok yang tersedia?',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              labelText: 'Jumlah Stok',
                              labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.w500),
                              errorStyle: TextStyle(fontFamily: "Poppins"),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: yellow))),
                          onChanged: (String str) {
                            setState(() {
                              stock = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Masukkan jumlah stok produk'
                              : (value.length > 6)
                                  ? 'Batas maksimal stok 9.999'
                                  : null),
                      TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              hintText: 'Berapa harga jual produk mu?',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              labelText: 'Harga',
                              labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.w500),
                              prefixText: 'Rp',
                              prefixStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: yellow,
                                  fontSize: 10.0),
                              errorStyle: TextStyle(fontFamily: "Poppins"),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: yellow))),
                          onChanged: (String str) {
                            setState(() {
                              price = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Masukkan harga produk'
                              : (value.length > 10)
                                  ? 'Tolong beri harga wajar'
                                  : null),
                      TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.normal),
                              hintText:
                                  'Berikan deskripsi atau keterangan produk mu!',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              labelText: 'Deskripsi',
                              labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.w500),
                              errorStyle: TextStyle(fontFamily: "Poppins"),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: yellow))),
                          // maxLength: 1000,
                          maxLines: 5,
                          onChanged: (String str) {
                            setState(() {
                              description = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Berikan deskripsi produk'
                              : (value.length > 1000)
                                  ? 'Batas maksimal karakter 1000'
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
    setState(() => _image1 = tempImg);
    // switch (imageNumber) {
    //   case 1:
    //     setState(() => _image1 = tempImg);
    //     break;
    //   case 2:
    //     setState(() => _image2 = tempImg);
    //     break;
    //   case 3:
    //     setState(() => _image3 = tempImg);
    //     break;
    // }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Image.network(
        '${widget.productModel.image.toString()}',
        fit: BoxFit.contain,
        width: double.infinity,
        height: 150.0,
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.contain,
        width: double.infinity,
        height: 150.0,
      );
    }
  }

  // Widget _displayChild2() {
  //   if (_image2 == null) {
  //     return Padding(
  //       padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
  //       child: new Icon(
  //         Icons.add,
  //         color: Colors.grey,
  //       ),
  //     );
  //   } else {
  //     return Image.file(
  //       _image2,
  //       fit: BoxFit.fill,
  //       width: double.infinity,
  //     );
  //   }
  // }

  // Widget _displayChild3() {
  //   if (_image3 == null) {
  //     return Padding(
  //       padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
  //       child: new Icon(
  //         Icons.add,
  //         color: Colors.grey,
  //       ),
  //     );
  //   } else {
  //     return Image.file(
  //       _image3,
  //       fit: BoxFit.fill,
  //       width: double.infinity,
  //     );
  //   }
  // }

  void save() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      // if (_image1 != null && _image2 != null && _image3 != null) {
      if (stock != null && price != null && description != null) {
        if (_image1 != null) {
          String imageUrl1;
          // String imageUrl2;
          // String imageUrl3;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "P1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 =
              storage.ref().child(picture1).putFile(_image1);
          // final String picture2 =
          //     "P2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          // StorageUploadTask task2 =
          //     storage.ref().child(picture2).putFile(_image2);
          // final String picture3 =
          //     "P3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          // StorageUploadTask task3 =
          //     storage.ref().child(picture3).putFile(_image3);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);
          // StorageTaskSnapshot snapshot2 =
          //     await task2.onComplete.then((snapshot) => snapshot);

          // task3.onComplete.then((snapshot3) async {
          //   imageUrl1 = await snapshot1.ref.getDownloadURL();
          //   imageUrl2 = await snapshot2.ref.getDownloadURL();
          //   imageUrl3 = await snapshot3.ref.getDownloadURL();
          //   List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];

          task1.onComplete.then((snapshot) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            _productService.updateProduct({
              "id": widget.productModel.id,
              "images": imageUrl1,
              "name": name,
              "stock": int.parse(stock),
              "price": int.parse(price),
              "description": description,
            });
            setState(() => loading = false);
            Navigator.pop(context);
          });
        } else {
          _productService.updateProduct({
            "id": widget.productModel.id,
            "images": widget.productModel.image.toString(),
            "name": name,
            "stock": int.parse(stock),
            "price": int.parse(price),
            "description": description,
          });
          setState(() => loading = false);
          Navigator.pop(context);
        }
      } else {
        setState(() => loading = false);
      }
    }
  }
}
