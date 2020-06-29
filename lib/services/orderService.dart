import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/orderModel.dart';

class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String userId, String id, String status ,List cart, int totalPrice}) {
    _firestore.collection(collection).document(id).setData({
      "id": id,
      "userId": userId,
      "cart": cart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      // "description": description,
      "status": status
    });
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

}