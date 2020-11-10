import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/shippingModel.dart';
import 'package:lingkung/models/userModel.dart';

class UserServices {
  String collection = "users";
  String subCollection = "trashCart";
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
        if (doc.data == null) {
          return null;
        }
        return UserModel.fromSnapshot(doc);
      });

  Future<UserModel> getOwnerById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<List<UserModel>> getUserByPhone({String phoNumberLogin}) async =>
      _firestore
          .collection(collection)
          .where("phoneNumber", isEqualTo: phoNumberLogin)
          .getDocuments()
          .then((result) {
        List<UserModel> userByPhones = [];
        for (DocumentSnapshot userByPhone in result.documents) {
          userByPhones.add(UserModel.fromSnapshot(userByPhone));
        }
        return userByPhones;
      });

  void addShipping({String userId, ShippingModel shippingModel}) {
    print("THE USER ID IS: $userId");
    print("shipping are: ${shippingModel.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      // "shipping": shippingModel.toMap()
      "shipping": FieldValue.arrayUnion([shippingModel.toMap()])
    });
  }

}
