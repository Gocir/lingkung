import 'dart:async';

import 'package:lingkung/models/shippingModel.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Models
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/models/userModel.dart';
// Services
import 'package:lingkung/services/orderService.dart';
import 'package:lingkung/services/userService.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userService = UserServices();
  OrderServices _orderService = OrderServices();
  UserModel _userModel;
  UserModel userById;
  List<CartItemModel> _cartItems = List<CartItemModel>();

  // getter
  FirebaseUser get user => _user;
  UserModel get userModel => _userModel;
  Status get status => _status;
  List<CartItemModel> get cartItems => _cartItems;

  // public variables
  List<OrderModel> orders = [];

  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  // Login email & pass
  Future<bool> login() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  // Register email & pass
  Future<bool> register() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').document(result.user.uid).setData({
          'uid': result.user.uid,
          'name': name.text,
          'phoneNumber': int.parse(''),
          'email': email.text,
          'image': "",
          'balance': int.parse(''),
          'point': int.parse(''),
          'weight': int.parse(''),
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  // Logout
  // Future logout() async {
  //   try {
  //     _status = Status.Unauthenticated;
  //     notifyListeners();
  //     await _auth.signOut();
  //     return true;
  //   } catch (e) {
  //     _status = Status.Authenticating;
  //     notifyListeners();
  //     print(e.toString());
  //     return false;
  //   }
  // }
  Future logout() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    email.text = "";
    password.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userService.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> loadUserById(String userId) async {
    userById = await _userService.getOwnerById(id: userId);
    notifyListeners();
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

  Future<bool> addAddress(
      {String addressLabel,
      String recipientsName,
      int phoNumber,
      String province,
      String city,
      String subDistrict,
      int posCode,
      String addressDetail}) async {
    print("ADDRESS LABEL: ${addressLabel.toString()}");
    print("RECIPIENTS NAME: ${recipientsName.toString()}");

    try {
      var uuid = Uuid();
      String addressId = uuid.v4();
      List addressList = _userModel.addressModel;
      Map addressModel = {
        "id": addressId,
        "addressLabel": addressLabel,
        "recipientsName": recipientsName,
        "phoNumber": phoNumber,
        "province": province,
        "city": city,
        "subDistrict": subDistrict,
        "posCode": posCode,
        "addressDetail": addressDetail,
        "isPrimary": false,
        "isCheck": false,
      };

      AddressModel address = AddressModel.fromMap(addressModel);
      print("ADDRESS ARE: ${addressList.toString()}");
      _userService.addAddress(userId: _user.uid, addressModel: address);
      notifyListeners();
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      notifyListeners();
      return false;
    }
  }

  Future<bool> addShipping({String id, String name, bool isCheck}) async {
    print("ID: ${id.toString()}");

    try {
      var uuid = Uuid();
      String shippingId = uuid.v4();
      List shippingList = _userModel.shippingModel;
      Map shippingModel = {
        "id": shippingId,
        "name": name,
        "isCheck": isCheck
      };

      ShippingModel shipping = ShippingModel.fromMap(shippingModel);
      print("ADDRESS ARE: ${shippingList.toString()}");
      _userService.addShipping(userId: _user.uid, shippingModel: shipping);
      notifyListeners();
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      notifyListeners();
      return false;
    }
  }

  Future<bool> addToCartProduct({ProductModel productModel, int quantity}) async {
    print("THE PRODUCT IS: ${productModel.toString()}");
    print("THE QUANTITY IS: ${quantity.toString()}");
    
    try {
      bool isExist = false;

      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List cart = _userModel.cartProduct;

      Map cartItem = {
        "id": cartItemId,
        "productId": productModel.id,
        "image": productModel.image,
        "name": productModel.name,
        "price": productModel.price,
        "quantity": quantity,
        "storeOwnerId": productModel.userId,
        "totalSaleProduct": productModel.price * quantity,
        "isCheck": false,
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
      
      //check if already in cart
      cartItems.forEach((cart) {
        if (cart.productId == productModel.id) {
          //already in cart, append qty
          // cart.quantity += 1;
          _userService.updateCartProduct(userId: _user.uid, cartItem: item);
          isExist = true;
        }
      });
      
      if (!isExist) {
        print("CART ITEMS ARE: ${cart.toString()}");
        _userService.addToCartProduct(userId: _user.uid, cartItem: item);
      }
      notifyListeners();
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      notifyListeners();
      return false;
    }
  }

  void increaseQuantity(String productId) {
    //check if already in cart
    cartItems.forEach((cart) {
      if (cart.productId == productId) {
        //already in cart, append qty
        cart.quantity += 1;
      }
    });
    //trigger listener
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    //check if already in cart
    cartItems.forEach((cart) {
      if (cart.productId == productId) {
        //check if greater than 1, cannot be 0
        if (cart.quantity > 1) {
          //already in cart, append qty
          cart.quantity -= 1;
        }
      }
    });
    //trigger listener
    notifyListeners();
  }

  //   //trigger listener
  //   notifyListeners();
  // }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("THE PRODUCT IS: ${cartItem.toString()}");

    try {
      _userService.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderService.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  // Future<bool> addToCarTrash({TrashReceiveModel trashReceiveModel}) async {
  //   print("THE PRODUCT IS: ${trashReceiveModel.toString()}");

  //   try {
  //     var uuid = Uuid();
  //     String cartItemId = uuid.v4();
  //     List cart = _userModel.cart;
  //     //bool itemExists = false;
  //     Map cartItem = {
  //       "id": cartItemId,
  //       "trashId": trashReceiveModel.id,
  //       "name": trashReceiveModel.trashName,
  //       "price": trashReceiveModel.price,
  //       "image": trashReceiveModel.image
  //     };

  //     CartItemModel item = CartItemModel.fromMap(cartItem);
  //     //  if(!itemExists){
  //     print("CART ITEMS ARE: ${cart.toString()}");
  //     _userService.addToCarTrash(userId: _user.uid, cartItem: item);
  //     //  }

  //     return true;
  //   } catch (e) {
  //     print("THE ERROR ${e.toString()}");
  //     return false;
  //   }
  // }

}
