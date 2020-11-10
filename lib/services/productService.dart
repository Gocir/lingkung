import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  String collection = 'products';
  Firestore _firestore = Firestore.instance;

  void addProduct(
      {Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(data['id'])
        .setData(data);
  }

  void updateProduct({Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(data['id'])
        .updateData(data);
  }

  Future<void> deleteProduct(String docId) async {
    _firestore
        .collection(collection)
        .document(docId)
        .delete();
  }

  Future<List<ProductModel>> getProduct() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<ProductModel> getProductById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return ProductModel.fromSnapshot(doc);
      });

  Future<List<ProductModel>> getProductByUser({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<ProductModel> productByUsers = [];
        for (DocumentSnapshot productByUser in result.documents) {
          productByUsers.add(ProductModel.fromSnapshot(productByUser));
        }
        return productByUsers;
      });
}