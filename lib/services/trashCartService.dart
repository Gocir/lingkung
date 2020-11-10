import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/trashCartModel.dart';

class TrashCartServices {
  String collection = "users";
  String subCollection = "trashCart";
  Firestore _firestore = Firestore.instance;

  void addTrashCart(
      {String userId, String documentId, Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(userId)
        .collection(subCollection)
        .document(documentId)
        .setData(data);
  }

  void updateTrashCart({String userId, Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(userId)
        .collection(subCollection)
        .document(data['id'])
        .updateData(data);
  }

  Future<void> deleteFromCart({String userId, String docId}) async {
    _firestore
        .collection(collection)
        .document(userId)
        .collection(subCollection)
        .document(docId)
        .delete();
  }

  Future<List<TrashCartModel>> getTrashCart() async =>
      _firestore.collection(subCollection).getDocuments().then((result) {
        List<TrashCartModel> trashCarts = [];
        for (DocumentSnapshot trashCart in result.documents) {
          trashCarts.add(TrashCartModel.fromSnapshot(trashCart));
        }
        return trashCarts;
      });

  Future<List<TrashCartModel>> getTrashCarts({String userId}) async => _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((result) {
        List<TrashCartModel> trashCarts = [];
        for (DocumentSnapshot trashCart in result.documents) {
          trashCarts.add(TrashCartModel.fromSnapshot(trashCart));
        }
        return trashCarts;
      });

  Future<int> getProfit({String userId}) async => _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((result) {
        if (result.documents == null) {
          return 0;
        }
        int _priceSum = 0;
        for (DocumentSnapshot trashCart in result.documents) {
          _priceSum += trashCart.data['price'] * trashCart.data['weight'];
        }
        int total = _priceSum;
        return total;
      });

  Future<List<String>> getDocument({String userId}) async => _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((snapshot) {
        List<String> document = [];
        for (DocumentSnapshot doc in snapshot.documents) {
          document.add(doc.documentID);
        }
        return document;
      });

  Future<List<TrashCartModel>> getTrashCartByUser({String userId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((result) {
        List<TrashCartModel> trashCartByUser = [];
        for (DocumentSnapshot trashCart in result.documents) {
          trashCartByUser.add(TrashCartModel.fromSnapshot(trashCart));
        }
        return trashCartByUser;
      });

  Future<TrashCartModel> getTrashCartByDoc(
          {String userId, String docId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .document(docId)
          .get()
          .then((doc) {
        return TrashCartModel.fromSnapshot(doc);
      });

  Future<List<TrashCartModel>> getTrashCartByReceive(
          {String userId, String trashTypeId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .where("trashTypeId", isEqualTo: trashTypeId)
          .getDocuments()
          .then((result) {
        List<TrashCartModel> trashCartByReceives = [];
        for (DocumentSnapshot trashCartByReceive in result.documents) {
          trashCartByReceives
              .add(TrashCartModel.fromSnapshot(trashCartByReceive));
        }
        return trashCartByReceives;
      });
}
