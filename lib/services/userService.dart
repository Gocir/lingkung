import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/userModel.dart';

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

  void addToCartProduct({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cartProduct": FieldValue.arrayUnion([cartItem.toMap()])
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
