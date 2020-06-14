import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingkung/services/product.dart';
import 'package:lingkung/utilities/loading.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  
  ProductService productService = ProductService();
  TextEditingController productNameController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  final priceController = TextEditingController();
  
  File _image1;
  File _image2;
  File _image3;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: loading
              ? Loading()
              : Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5), width: 2.5),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      1);
                                },
                                child: _displayChild1()),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5), width: 2.5),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      2);
                                },
                                child: _displayChild2()),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5), width: 2.5),
                              onPressed: () {
                                _selectImage(
                                    ImagePicker.pickImage(
                                        source: ImageSource.gallery),
                                    3);
                              },
                              child: _displayChild3(),
                            ),
                          ),
                        ),
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
                        }
                      ),
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
                        }
                      ),
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
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
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

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      if (_image1 != null && _image2 != null && _image3 != null) {
        if (stockController != null && priceController != null) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 =
              storage.ref().child(picture1).putFile(_image1);
          final String picture2 =
              "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task2 =
              storage.ref().child(picture2).putFile(_image2);
          final String picture3 =
              "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task3 =
              storage.ref().child(picture3).putFile(_image3);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);
          StorageTaskSnapshot snapshot2 =
              await task2.onComplete.then((snapshot) => snapshot);

          task3.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];

            productService.addProduct({
              "name":productNameController.text,
              "price":double.parse(priceController.text),
              "images":imageList,
              "stock":int.parse(stockController.text),
            });
            _formKey.currentState.reset();
            setState(() => loading = false);
//            Fluttertoast.showToast(msg: 'Product added');
            Navigator.pop(context);
          });
        } else {
          setState(() => loading = false);
//          Fluttertoast.showToast(msg: 'select atleast one size');
        }
      } else {
        setState(() => loading = false);
//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }
}

// import 'dart:io';
// import 'package:lingkung/utilities/loading.dart';
// import 'package:flutter/material.dart';

// class AddUpdateProduct extends StatefulWidget {
//   @override
//   _AddUpdateProductState createState() => _AddUpdateProductState();
// }

// class _AddUpdateProductState extends State<AddUpdateProduct> {
//   final _formkey = GlobalKey<FormState>();

//   bool loading = false;

//   File _image1;
//   File _image2;
//   File _image3;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Tambah Produk")),
//       body: Container(
//         margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Nama',
//                           labelStyle: TextStyle(
//                               color: Colors.Colors.grey,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.0),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: const Color(0xff5bc0eb))),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Stock',
//                           labelStyle: TextStyle(
//                             color: Colors.Colors.grey,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.0),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide:
//                               BorderSide(color: const Color(0xff5bc0eb))
//                             ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Harga',
//                           labelStyle: TextStyle(
//                             color: Colors.Colors.grey,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.0),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide:
//                               BorderSide(color: const Color(0xff5bc0eb))
//                             ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 45.0,
//               margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
//               child: RaisedButton(
//                 color: const Color(0xff9bc53d),
//                 elevation: 2.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50)),
//                 child: Center(
//                   child: Text(
//                     'Simpan',
//                     style: TextStyle(
//                       color: const Color(0xffffffff),
//                       fontWeight: FontWeight.w700,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ),
//                 onPressed: () {

//                 }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
