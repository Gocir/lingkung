import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  String phoneNumber;
  File _selectedImage;

  bool loading = false;
  @override
  void initState() {
    super.initState();
    _name = widget.userModel.name;
    email = widget.userModel.email.toString();
    phoneNumber = widget.userModel.phoNumber.toString();

    nameController = TextEditingController(text: widget.userModel.name);
    emailController =
        TextEditingController(text: widget.userModel.email.toString());
    phoNumberController =
        TextEditingController(text: widget.userModel.phoNumber.toString());
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
                    title: CustomText(
                      text: 'Perbarui Profil',
                      color: black,
                      size: 18.0,
                      weight: FontWeight.w600,
                    ),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.help_outline), onPressed: () {})
                    ]),
                body: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Center(
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        imageWidget(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 0),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.edit, color: blue),
                                            onPressed: () {
                                              _getImage();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  CustomText(
                                      text: 'Nama', weight: FontWeight.w700),
                                  TextFormField(
                                      controller: nameController,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(
                                          fontFamily: "Poppins", color: black),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          counterStyle: TextStyle(
                                              fontFamily: "Poppins",
                                              color: black),
                                          hintText: 'Contoh: Aksara Melinkung',
                                          hintStyle:
                                              TextStyle(fontFamily: "Poppins"),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: blue))),
                                      onChanged: (str) {
                                        setState(() {
                                          _name = str;
                                        });
                                      },
                                      validator: (val) => val.isEmpty
                                          ? 'Berikan nama pengguna akun'
                                          : null),
                                  SizedBox(height: 16.0),
                                  CustomText(
                                      text: 'Email', weight: FontWeight.w700),
                                  TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontFamily: "Poppins", color: black),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          counterStyle: TextStyle(
                                              fontFamily: "Poppins",
                                              color: black),
                                          hintText:
                                              'Contoh: karolingkung@mail.com',
                                          hintStyle:
                                              TextStyle(fontFamily: "Poppins"),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: blue))),
                                      onChanged: (str) {
                                        setState(() {
                                          email = str;
                                        });
                                      },
                                      validator: (val) => val.isEmpty
                                          ? 'Masukkan alamat email dengan benar'
                                          : null),
                                  SizedBox(height: 16.0),
                                  CustomText(
                                      text: 'Nomor HP',
                                      weight: FontWeight.w700),
                                  TextFormField(
                                      readOnly: true,
                                      enabled: false,
                                      controller: phoNumberController,
                                      style: TextStyle(
                                          fontFamily: "Poppins", color: grey),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          counterStyle: TextStyle(
                                              fontFamily: "Poppins",
                                              color: grey)))
                                ])))),
                bottomNavigationBar: Container(
                    height: 80.0,
                    padding: const EdgeInsets.all(16.0),
                    child: FlatButton(
                        color: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: CustomText(
                            text: 'SIMPAN',
                            color: white,
                            size: 16,
                            weight: FontWeight.w700),
                        onPressed: () {
                          save();
                        }))),
          );
  }

  Widget imageWidget() {
    if (_selectedImage != null) {
      return Container(
        height: 150.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.file(
            _selectedImage,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: widget.userModel?.image.toString(),
        imageBuilder: (context, imageProvider) =>
            CircleAvatar(radius: 75.0, backgroundImage: imageProvider),
        placeholder: (context, url) => CircleAvatar(
          radius: 75.0,
          child: SpinKitThreeBounce(color: black, size: 20.0),
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          radius: 75.0,
          backgroundImage: AssetImage("assets/images/noimage.png"),
        ),
      );
    }
  }

  void _getImage() async {
    File image = await ImagePickerGC.pickImage(
        context: context,
        source: ImgSource.Both,
        cameraIcon: Icon(Icons.camera_alt, color: black),
        cameraText:
            CustomText(text: 'Kamera', size: 18.0, weight: FontWeight.w600),
        galleryIcon: Icon(Icons.photo_library, color: black),
        galleryText:
            CustomText(text: 'Galeri', size: 18.0, weight: FontWeight.w600),
        barrierDismissible: true);
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

  void save() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      if (_name != null && email != null) {
        if (_selectedImage != null) {
          String imageUrl;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture =
              "U${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task =
              storage.ref().child(picture).putFile(_selectedImage);
          StorageTaskSnapshot taskSnapshot =
              await task.onComplete.then((snapshot) => snapshot);
          task.onComplete.then((snapshot) async {
            imageUrl = await taskSnapshot.ref.getDownloadURL();
            _userService.updateUserData({
              "uid": widget.userModel.id,
              "image": imageUrl,
              "name": _name,
              "email": email
            });
            print('nama, email, dan foto saved!');
            setState(() => loading = false);
            Navigator.pop(context);
            userProvider.reloadUserModel();
          });
        } else {
          _userService.updateUserData({
            "uid": widget.userModel.id,
            "name": _name,
            "email": email,
          });
          print('nama dan email saved!');
          setState(() => loading = false);
          Navigator.pop(context);
          userProvider.reloadUserModel();
        }
      } else {
        if (_selectedImage != null) {
          String imageUrl;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture =
              "U${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task =
              storage.ref().child(picture).putFile(_selectedImage);
          StorageTaskSnapshot taskSnapshot =
              await task.onComplete.then((snapshot) => snapshot);
          task.onComplete.then((snapshot) async {
            imageUrl = await taskSnapshot.ref.getDownloadURL();
            _userService.updateUserData({
              "uid": widget.userModel.id,
              "image": imageUrl,
              "email": email,
            });
            print('email dan foto saved!');
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
        _scaffoldStateKey.currentState.showSnackBar(SnackBar(
            content: CustomText(
                text: "Tolong Isi Data Dengan Benar",
                color: white,
                weight: FontWeight.w600)));
        loading = false;
      });
    }
  }
}
