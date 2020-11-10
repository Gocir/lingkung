import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
// Firebase
import 'package:firebase_storage/firebase_storage.dart';
// Models
import 'package:lingkung/models/productModel.dart';
//  Providers
import 'package:lingkung/providers/productProvider.dart';
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
  final FirebaseStorage storage = FirebaseStorage.instance;
  ProductServices _productService = ProductServices();

  TextEditingController nameController;
  TextEditingController stockController;
  TextEditingController priceController;
  TextEditingController descriptionController;

  String name;
  String stock;
  String price;
  String description;
  File _image1;
  // File _image2;
  // File _image3;

  bool loading = false;
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
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: black),
              // title: CustomText(
              //   text: 'Perbarui Produk',
              //   color: white,
              //   size: 18.0,
              //   weight: FontWeight.w600,
              // ),
              actions: [
                IconButton(
                  icon: Icon(Icons.help_outline),
                  onPressed: () {},
                ),
              ],
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 180.0,
                              child: OutlineButton(
                                padding: const EdgeInsets.all(0),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 2.5),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      1);
                                },
                                child: _displayChild1(),
                              ),
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
                      SizedBox(height: 16.0),
                      CustomText(
                        text: 'Nama Produk',
                        weight: FontWeight.w600,
                      ),
                      TextFormField(
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(fontFamily: "Poppins", color: black),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(bottom: 8.0),
                          counterStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          hintText: 'Contoh: Tas Ransel Daur Ulang',
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          errorStyle: TextStyle(fontFamily: "Poppins"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                        ),
                        onChanged: (String str) {
                          setState(() {
                            name = str;
                          });
                        },
                        validator: (value) => (value.isEmpty)
                            ? 'Masukkan nama produkmu'
                            : (value.length > 100)
                                ? 'Batas maksimal karakter 100'
                                : null,
                      ),
                      SizedBox(height: 16.0),
                      CustomText(
                        text: 'Jumlah Stok',
                        weight: FontWeight.w600,
                      ),
                      TextFormField(
                        controller: stockController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontFamily: "Poppins", color: black),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(bottom: 8.0),
                          counterStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          hintText: 'Contoh: 31',
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          errorStyle: TextStyle(fontFamily: "Poppins"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                        ),
                        onChanged: (String str) {
                          setState(() {
                            stock = str;
                          });
                        },
                        validator: (value) => (value.isEmpty)
                            ? 'Masukkan jumlah stok produkmu'
                            : (value.length > 6)
                                ? 'Batas maksimal stok 9.999'
                                : null,
                      ),
                      SizedBox(height: 16.0),
                      CustomText(
                        text: 'Harga',
                        weight: FontWeight.w600,
                      ),
                      TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontFamily: "Poppins", color: black),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(bottom: 8.0),
                          counterStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          hintText: 'Contoh: 310000',
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          prefixText: 'Rp',
                          prefixStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.red,
                          ),
                          errorStyle: TextStyle(fontFamily: "Poppins"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                        ),
                        onChanged: (String str) {
                          setState(() {
                            price = str;
                          });
                        },
                        validator: (value) => (value.isEmpty)
                            ? 'Masukkan harga jual produkmu'
                            : (value.length > 10)
                                ? 'Tolong beri harga wajar'
                                : null,
                      ),
                      SizedBox(height: 16.0),
                      CustomText(
                        text: 'Deskripsi',
                        weight: FontWeight.w600,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        style: TextStyle(fontFamily: "Poppins", color: black),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(bottom: 8.0),
                          counterStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          hintText:
                              'Contoh: Tas Ransel Daur Ulang\nBahan : Plastik Bekas Rinso\nUkuran : 30 x 30 cm',
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          errorStyle: TextStyle(fontFamily: "Poppins"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                        ),
                        maxLines: 5,
                        onChanged: (String str) {
                          setState(() {
                            description = str;
                          });
                        },
                        validator: (value) => (value.isEmpty)
                            ? 'Berikan deskripsi untuk produkmu'
                            : (value.length > 1000)
                                ? 'Batas maksimal karakter 1000'
                                : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 80.0,
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                color: green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: CustomText(
                    text: 'SIMPAN',
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
      return CachedNetworkImage(
        imageUrl: widget.productModel.image.toString(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
            color: white,
          ),
        ),
        placeholder: (context, url) =>
            SpinKitThreeBounce(color: black, size: 10.0),
        errorWidget: (context, url, error) =>
            Image.asset("assets/images/user.png"),
      );
    } else {
      return Image.file(_image1);
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
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });

      // if (_image1 != null && _image2 != null && _image3 != null) {
      if (name != null &&
          stock != null &&
          price != null &&
          description != null) {
        if (_image1 != null) {
          String imageUrl1;
          // String imageUrl2;
          // String imageUrl3;

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
            productProvider.updateProduct(
              productId: widget.productModel.id,
              images: imageUrl1,
              name: name,
              stock: int.parse(stock),
              price: int.parse(price),
              description: description,
              userId: widget.productModel.userId,
              userName: widget.productModel.userName,
            );
            setState(() {
              loading = false;
            });
            Navigator.pop(context);
          });
        } else {
          productProvider.updateProduct(
            productId: widget.productModel.id,
            images: widget.productModel.image.toString(),
            name: name,
            stock: int.parse(stock),
            price: int.parse(price),
            description: description,
            userId: widget.productModel.userId,
            userName: widget.productModel.userName,
          );
          setState(() {
            loading = false;
          });
          Navigator.pop(context);
          Navigator.pop(context);
        }
      } else {
        setState(() {
          loading = false;
        });
        _emptyModalBottomSheet(context);
      }
    } else {
      setState(() {
          loading = false;
        });
      _emptyModalBottomSheet(context);
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
                    child: Image.asset("assets/images/verifailed.png"),
                  ),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CustomText(
                        text: 'OKE',
                        color: white,
                        size: 16.0,
                        weight: FontWeight.w700,
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
        );
      },
    );
  }
}
