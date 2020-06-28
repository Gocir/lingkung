import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingkung/services/productService.dart';
import 'package:lingkung/utilities/loading.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  ProductServices _productService = ProductServices();
  TextEditingController productNameController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  File _image1;
  // File _image2;
  // File _image3;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffffffff),
              iconTheme: IconThemeData(color: const Color(0xff000000)),
              title: Text(
                "Tambah Product",
                style: TextStyle(color: const Color(0xff000000)),
              ),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: productNameController,
                        decoration: InputDecoration(hintText: 'Nama Produk'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Isi nama produk-mu';
                          } else if (value.length > 32) {
                            return 'Tidak boleh lebih dari 32 kata';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                          controller: stockController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Jumlah Stok',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Masukkan jumlah stok produk';
                            } else if (value.length > 6) {
                              return 'Batas maksimal stok 9.999';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Harga',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Masukkan harga produk-mu';
                            } else if (value.length > 10) {
                              return 'Tolong beri harga wajar';
                            }
                          }),
                    ),
                    FlatButton(
                      color: Colors.red,
                      textColor: const Color(0xffffffff),
                      child: Text('Simpan'),
                      onPressed: () {
                        validateAndUpload();
                      },
                    )
                  ],
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
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
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

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      // if (_image1 != null && _image2 != null && _image3 != null) {
      if (_image1 != null) {
        if (stockController != null && priceController != null) {
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
            FirebaseAuth auth = FirebaseAuth.instance;
            FirebaseUser _user = await auth.currentUser();
            _productService.addProduct({
              "name": productNameController.text,
              "price": int.parse(priceController.text),
              "images": imageUrl1,
              "stock": int.parse(stockController.text),
              "userId": _user.uid,
            });
            // _formKey.currentState.reset();
            setState(() => loading = false);
            Navigator.pop(context);
          });
        } else {
          setState(() => loading = false);
        }
      } else {
        setState(() => loading = false);
      }
    }
  }
}
