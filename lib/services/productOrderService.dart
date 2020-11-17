import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/productOrderModel.dart';

class ProductOrderServices {
  String collection = "productOrders";
  Firestore _firestore = Firestore.instance;

  void addProductOrder(
      {Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(data['id'])
        .setData(data);
  }

  void updateProductOrder({Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(data['id'])
        .updateData(data);
  }

  Future<void> deleteProductOrder(String docId) async {
    _firestore
        .collection(collection)
        .document(docId)
        .delete();
  }

   Future<List<ProductOrderModel>> getOrder() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<ProductOrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(ProductOrderModel.fromSnapshot(order));
        }
        return orders;
      });

  Future<ProductOrderModel> getOrderById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return ProductOrderModel.fromSnapshot(doc);
      });
      
  Future<List<ProductOrderModel>> getOrderByOwners({String userId, String status}) async => _firestore
          .collection(collection)
          .where("storeOwnerId", isEqualTo: userId)
          .where("status", isEqualTo: status)
          .getDocuments()
          .then((result) {
        List<ProductOrderModel> userOrders = [];
        for (DocumentSnapshot order in result.documents) {
          userOrders.add(ProductOrderModel.fromSnapshot(order));
        }
        return userOrders;
      });
  
  Future<List<ProductOrderModel>> getUserOrderByStatus({String userId, String status}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .where("status", isEqualTo: status)
          .getDocuments()
          .then((result) {
        List<ProductOrderModel> orderByStatus = [];
        for (DocumentSnapshot order in result.documents) {
          orderByStatus.add(ProductOrderModel.fromSnapshot(order));
        }
        return orderByStatus;
      });
}
