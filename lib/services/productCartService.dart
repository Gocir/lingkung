import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/productCartModel.dart';

class ProductCartServices {
  String collection = "users";
  String subCollection = "productCarts";
  Firestore _firestore = Firestore.instance;

  void addProductCart(
      {String userId, Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(userId)
        .collection(subCollection)
        .document(data['id'])
        .setData(data);
  }

  void updateProductCart({String userId, Map<String, dynamic> data}) {
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

  Future<List<ProductCartModel>> getProductCart() async =>
      _firestore.collection(subCollection).getDocuments().then((result) {
        List<ProductCartModel> productCarts = [];
        for (DocumentSnapshot productCart in result.documents) {
          productCarts.add(ProductCartModel.fromSnapshot(productCart));
        }
        return productCarts;
      });

  Future<List<ProductCartModel>> getProductCarts({String userId}) async => _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((result) {
        List<ProductCartModel> productCarts = [];
        for (DocumentSnapshot productCart in result.documents) {
          productCarts.add(ProductCartModel.fromSnapshot(productCart));
        }
        return productCarts;
      });

  Future<int> getTotal({String userId}) async => _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((result) {
        if (result.documents == null) {
          return 0;
        }
        int _priceSum = 0;
        for (DocumentSnapshot productCart in result.documents) {
          // if (productCart.data['isCheck'] == true) {
            _priceSum += productCart.data['price'] * productCart.data['quantity'];
          // }
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

  Future<List<ProductCartModel>> getProductCartByUser({String userId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((result) {
        List<ProductCartModel> productCartByUser = [];
        for (DocumentSnapshot productCart in result.documents) {
          productCartByUser.add(ProductCartModel.fromSnapshot(productCart));
        }
        return productCartByUser;
      });

  Future<ProductCartModel> getProductCartByDoc(
          {String userId, String docId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .document(docId)
          .get()
          .then((doc) {
        return ProductCartModel.fromSnapshot(doc);
      });

  Future<List<ProductCartModel>> getProductCartByReceive(
          {String userId, String productTypeId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .where("productTypeId", isEqualTo: productTypeId)
          .getDocuments()
          .then((result) {
        List<ProductCartModel> productCartByReceives = [];
        for (DocumentSnapshot productCartByReceive in result.documents) {
          productCartByReceives
              .add(ProductCartModel.fromSnapshot(productCartByReceive));
        }
        return productCartByReceives;
      });
}
