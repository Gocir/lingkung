import 'dart:async';

import 'package:lingkung/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Firebase
import 'package:firebase_auth/firebase_auth.dart';
// Models
import 'package:lingkung/models/shippingModel.dart';
import 'package:lingkung/models/userModel.dart';
//  Screens
import 'package:lingkung/screens/authenticate/VerificationView.dart';
// Services
import 'package:lingkung/services/userService.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }
//  Unitialized: Memeriksa apakah pengguna masuk atau tidak. Dalam keadaan ini, kami akan menampilkan Loading.
//  Unauthenticated: Dalam Status ini, kami akan menampilkan halaman authenticate untuk memasukkan kredensial.
//  Authenticating: Pengguna telah menekan tombol masuk dan kami mengautentikasi pengguna. Dalam Status ini, kami akan menampilkan bilah Kemajuan.
//  Authenticated: Pengguna diautentikasi. Dalam Status ini, kami akan menampilkan beranda.

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userService = UserServices();
  UserModel _userModel;
  UserModel userById;

  // getter
  FirebaseUser get user => _user;
  UserModel get userModel => _userModel;
  Status get status => _status;

  //  public variable
  List<UserModel> userByPhone = [];

  final scaffoldStatekey = GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController phoNumberLogin = TextEditingController();
  TextEditingController userName = TextEditingController();

  String smsCode;
  String verificationId;
  String errorMessage;
  String name;
  String mail;
  bool loading = false;

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  //  Code Sent
  Future<void> verify(BuildContext context, String phoneNumber, String userName,
      String email) async {
    name = userName;
    mail = email;
    final PhoneCodeSent codeSent = (String verifId, [int forceCodeResend]) {
      this.verificationId = verifId;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerificationView(phoneNumber: phoneNumber)));
    };

    final PhoneVerificationCompleted verified =
        (AuthCredential authCredential) {
      // _userService.login(authCredential);
      print(authCredential.toString() + "lets make this work");
    };

    final PhoneVerificationFailed verifailed = (AuthException authException) {
      print(authException.message.toString());
      errorMessage = authException.message;
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber.trim(), // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verifId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verifId;
          },
          codeSent:
              codeSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: verified,
          verificationFailed: verifailed);
      clearController();
    } catch (e) {
      print(e.toString());
      errorMessage = e.message.toString();
      clearController();
    }
  }

  //  Register
  void _register(
      {String id, String userName, String email, String phoneNumber}) {
    _userService.createUser({
      'uid': id,
      'name': userName,
      'phoneNumber': phoneNumber,
      'email': email,
      'image': "",
      'balance': 0,
      'point': 0,
      'weight': 0,
    });
  }

  //  VerifyCode
  void verifyCodeOTP(BuildContext context, String smsCode) async {
    final AuthCredential _authCredential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    _auth.signInWithCredential(_authCredential).then((AuthResult result) async {
      print('Authentication successful');
      if (result.user.uid == user.uid) {
        _userModel = await _userService.getUserById(user.uid);
        if (_userModel == null) {
          _register(
              id: result.user.uid,
              userName: name,
              email: mail,
              phoneNumber: result.user.phoneNumber);
          print('register');
        }
        print('from result ' + result.user.uid);
        print('phone from result ' + result.user.phoneNumber);
        print('phone from user ' + user.phoneNumber);
        print('from user ' + user.uid);
      }
      _status = Status.Authenticated;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      reloadUserModel();
    }).catchError((e) {
      _status = Status.Unauthenticated;
      print(
          'Something has gone wrong, please try later(signInWithPhoneNumber) $e');
    });
  }

  // Logout
  Future logout() async {
    try {
      _status = Status.Unauthenticated;
      notifyListeners();
      await _auth.signOut();
      print('user Logout');
      return true;
    } catch (e) {
      _status = Status.Authenticating;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  void clearController() {
    userName.text = "";
    email.text = "";
    phoNumberLogin.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userService.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> loadUserById(String userId) async {
    userById = await _userService.getOwnerById(id: userId);
    // notifyListeners();
  }

  Future<void> loadUserByPhone(String phoNumber) async {
    userByPhone = await _userService.getUserByPhone(phoNumberLogin: phoNumber);
    // notifyListeners();
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(user.uid);
    }
    notifyListeners();
  }

  /////////////////////////   SHIPPING   ////////////////////////
  Future<void> manipulateShipping({String id, String name, String duration, String type, int price, String status, String userId}) async {
    print("Name: ${name.toString()}");

    try {
      Map shippingMap = {
        "id": id,
        "name": name,
        "duration": duration,
        "type": type,
        "price": price,
      };

      ShippingModel shippingModel = ShippingModel.fromMap(shippingMap);
      if (status == "add") {
        _userService.addShipping(userId: userId, shippingModel: shippingModel);
      } else {
        _userService.deleteShipping(userId: userId, shippingModel: shippingModel);
      }
      notifyListeners();
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      notifyListeners();
    }
  }

  // /////////////////////////   PRODUCT   ////////////////////////
  // Future<bool> addToCartProduct(
  //     {ProductModel productModel, int quantity}) async {
  //   print("THE PRODUCT IS: ${productModel.toString()}");
  //   print("THE QUANTITY IS: ${quantity.toString()}");

  //   try {
  //     bool isExist = false;

  //     var uuid = Uuid();
  //     String cartProductId = uuid.v4();
  //     List cart = _userModel.cartProduct;

  //     Map cartProduct = {
  //       "id": cartProductId,
  //       "productId": productModel.id,
  //       "image": productModel.image,
  //       "name": productModel.name,
  //       "price": productModel.price,
  //       "quantity": quantity,
  //       "storeOwnerId": productModel.userId,
  //       "totalSaleProduct": productModel.price * quantity,
  //       "isCheck": false,
  //     };

  //     CartProductModel item = CartProductModel.fromMap(cartProduct);

  //     //check if already in cart
  //     cartProducts.forEach((cart) {
  //       if (cart.productId == productModel.id) {
  //         //already in cart, append qty
  //         // cart.quantity += 1;
  //         _userService.updateCartProduct(userId: _user.uid, cartProduct: item);
  //         isExist = true;
  //       }
  //     });

  //     if (!isExist) {
  //       print("CART ITEMS ARE: ${cart.toString()}");
  //       _userService.addToCartProduct(userId: _user.uid, cartProduct: item);
  //     }
  //     notifyListeners();
  //     return true;
  //   } catch (e) {
  //     print("THE ERROR ${e.toString()}");
  //     notifyListeners();
  //     return false;
  //   }
  // }

  // Future<bool> removeFromCartProduct({CartProductModel cartProduct}) async {
  //   print("THE PRODUCT IS: ${cartProduct.toString()}");

  //   try {
  //     _userService.removeFromCartProduct(
  //         userId: _user.uid, cartProduct: cartProduct);
  //     return true;
  //   } catch (e) {
  //     print("THE ERROR ${e.toString()}");
  //     return false;
  //   }
  // }
}
