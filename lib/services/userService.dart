import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/shippingModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/screens/products/cartProduct.dart';

class UserServices {
  String collection = "users";
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["uid"];
    _firestore.collection(collection).document(id).setData(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore
        .collection(collection)
        .document(values['uid'])
        .updateData(values);
  }

  Future<UserModel> getUserById(String id) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<UserModel> getOwnerById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  void addAddress({String userId, AddressModel addressModel}) {
    print("THE USER ID IS: $userId");
    print("address are: ${addressModel.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "address": FieldValue.arrayUnion([addressModel.toMap()])
    });
  }

  void addShipping({String userId, ShippingModel shippingModel}) {
    print("THE USER ID IS: $userId");
    print("shipping are: ${shippingModel.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      // "shipping": shippingModel.toMap()
      "shipping": FieldValue.arrayUnion([shippingModel.toMap()])
    });
  }

  void addToCartProduct({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cartProduct": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }
  
  void updateCartProduct({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cartProduct": FieldValue.arrayUnion([cartItem.quantity + 1])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cartProduct": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

  // void addToCarTrash({String userId, CartItemModel cartItem}) {
  //   print("THE USER ID IS: $userId");
  //   print("cart items are: ${cartItem.toString()}");
  //   _firestore.collection(collection).document(userId).updateData({
  //     "carTrash": FieldValue.arrayUnion([cartItem.toMap()])
  //   });
  // }
}
