import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';
//  Models
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/userProvider.dart';
//  Services
import 'package:lingkung/services/userService.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  final UserModel userModel;
  UpdateProfile({this.userModel});
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');

  UserServices _userService = UserServices();

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoNumberController;

  String _name;
  String email;
  String _phoNumber;
  File _selectedImage;

  bool loading = false;
  @override
  void initState() {
    super.initState();
    _name = widget.userModel.name;
    email = widget.userModel.email.toString();
    _phoNumber = widget.userModel.phoNumber.toString();

    nameController = TextEditingController(text: widget.userModel.name);
    emailController =
        TextEditingController(text: widget.userModel.email.toString());
    phoNumberController =
        TextEditingController(text: widget.userModel.phoNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldStateKey,
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: blue,
              elevation: 0.0,
              iconTheme: IconThemeData(color: white),
              title: CustomText(
                text: 'Perbarui Profil',
                color: white,
                size: 18.0,
                weight: FontWeight.w600,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                                icon: Icon(Icons.photo_library, color: black),
                                onPressed: () {
                                  _getImage(ImageSource.gallery);
                                }),
                          ),
                          Container(
                              width: 150.0,
                              height: 150.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: imageWidget())),
                          Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              icon: Icon(Icons.photo_camera, color: black),
                              onPressed: () {
                                _getImage(ImageSource.camera);
                              }),
                          ),
                        ],
                      ),
                      TextFormField(
                          autovalidate: true,
                          controller: nameController,
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
                              hintText: 'Apa Nama Panggilan-mu?',
                              hintStyle: TextStyle(fontFamily: "Poppins"),
                              labelText: 'Nama',
                              labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: black,
                                  fontWeight: FontWeight.w500),
                              errorStyle: TextStyle(fontFamily: "Poppins"),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: yellow))),
                          onChanged: (String str) {
                            setState(() {
                              _name = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Masukkan Nama-mu, Tidak Boleh Kosong'
                              : (!nameExp.hasMatch(value))
                                  ? 'Harap Masukkan Hanya Karakter Alfabet'
                                  : null),
                      TextFormField(
                        enabled: false,
                        autovalidate: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: grey,
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                            counterStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: black,
                                fontWeight: FontWeight.normal),
                            hintText: 'Cth: username@domain.hosting',
                            hintStyle: TextStyle(fontFamily: "Poppins"),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: grey,
                                fontWeight: FontWeight.w500),
                            errorStyle: TextStyle(fontFamily: "Poppins"),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: yellow))),
                        // onChanged: (String str) {
                        //   setState(() {
                        //     email = str;
                        //   });
                        // },
                        // validator: (value) =>
                        //     (value.isEmpty) ? 'Masukkan email-mu' : null
                      ),
                      TextFormField(
                          autovalidate: true,
                          keyboardType: TextInputType.phone,
                          controller: phoNumberController,
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
                              labelText: 'Nomor Ponsel',
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
                              _phoNumber = str;
                            });
                          },
                          validator: (value) => (value.isEmpty)
                              ? 'Masukkan Nomor Ponsel-mu'
                              : (value.length > 11)
                                  ? 'Batas Maksimal Nomor Ponsel adalah 11'
                                  : null),
                      Container(
                          height: 48.0,
                          margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
                          child: RaisedButton(
                            color: green,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: CustomText(
                                  text: 'SIMPAN',
                                  color: white,
                                  size: 16,
                                  weight: FontWeight.w700),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                if (_name != null && _phoNumber != null) {
                                  if (_selectedImage != null) {
                                    String imageUrl;

                                    final FirebaseStorage storage =
                                        FirebaseStorage.instance;
                                    final String picture =
                                        "U${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                                    StorageUploadTask task = storage
                                        .ref()
                                        .child(picture)
                                        .putFile(_selectedImage);
                                    StorageTaskSnapshot taskSnapshot =
                                        await task.onComplete
                                            .then((snapshot) => snapshot);
                                    task.onComplete.then((snapshot) async {
                                      imageUrl = await taskSnapshot.ref
                                          .getDownloadURL();
                                      _userService.updateUserData({
                                        "uid": widget.userModel.id,
                                        "image": imageUrl,
                                        "name": _name,
                                        // "email": email,
                                        "phoneNumber": int.parse(_phoNumber),
                                      });
                                      setState(() => loading = false);
                                      Navigator.pop(context);
                                      userProvider.reloadUserModel();
                                    });
                                  } else {
                                    _userService.updateUserData({
                                      "uid": widget.userModel.id,
                                      "name": _name,
                                      // "email": email,
                                      "phoneNumber": int.parse(_phoNumber),
                                    });
                                    setState(() => loading = false);
                                    Navigator.pop(context);
                                    userProvider.reloadUserModel();
                                  }
                                } else {
                                  if (_selectedImage != null) {
                                    String imageUrl;

                                    final FirebaseStorage storage =
                                        FirebaseStorage.instance;
                                    final String picture =
                                        "U${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                                    StorageUploadTask task = storage
                                        .ref()
                                        .child(picture)
                                        .putFile(_selectedImage);
                                    StorageTaskSnapshot taskSnapshot =
                                        await task.onComplete
                                            .then((snapshot) => snapshot);
                                    task.onComplete.then((snapshot) async {
                                      imageUrl = await taskSnapshot.ref
                                          .getDownloadURL();
                                      _userService.updateUserData({
                                        "uid": widget.userModel.id,
                                        "image": imageUrl,
                                        // "email": email,
                                      });
                                      setState(() => loading = false);
                                      Navigator.pop(context);
                                      userProvider.reloadUserModel();
                                    });
                                  } else {
                                    setState(() => loading = false);
                                  }
                                }
                              } else {
                                setState(() {
                                  _scaffoldStateKey.currentState
                                      .showSnackBar(SnackBar(
                                          content: CustomText(
                                    text: "Tolong Isi Data Dengan Benar",
                                    color: white,
                                    weight: FontWeight.w600,
                                  )));
                                  loading = false;
                                });
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget imageWidget() {
    if (_selectedImage != null) {
      return Image.file(
        _selectedImage,
        fit: BoxFit.cover,
      );
    } else if (widget.userModel.image.toString() != null) {
      return Image.network("${widget.userModel.image.toString()}",
          scale: 1.0, fit: BoxFit.cover);
    } else {
      return Image.asset(
        "assets/images/user.png",
        fit: BoxFit.cover,
      );
    }
  }

  void _getImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 500,
          maxHeight: 500,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarColor: blue,
              toolbarWidgetColor: white,
              toolbarTitle: "Atur Foto",
              statusBarColor: blue,
              backgroundColor: white,
              activeControlsWidgetColor: green));

      setState(() {
        _selectedImage = cropped;
      });
    }
  }
}
