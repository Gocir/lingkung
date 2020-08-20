import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/orderModel.dart';

class OrderServices {
  String collection = "productorders";
  Firestore _firestore = Firestore.instance;

  void createOrder(
      {String userId,
      String id,
      List<AddressModel> address,
      String note,
      String status,
      List<CartItemModel> listProduct,
      int totalPrice}) {
    List<Map> convertedCart = [];
    List<Map> convertedAddress = [];
    List<String> storeOwnerUid = [];

    for (CartItemModel item in listProduct) {
      convertedCart.add(item.toMap());
      storeOwnerUid.add(item.storeOwnerId);
    }
    
    for (AddressModel item in address) {
      convertedAddress.add(item.toMap());
    }

    _firestore.collection(collection).document(id).setData({
      "id": id,
      "userId": userId,
      "storeOwnerId": storeOwnerUid,
      "address": convertedAddress,
      "listProduct": convertedCart,
      "total": totalPrice,
      "note": note,
      "status": status,
      "createdAt": DateTime.now().millisecondsSinceEpoch
    });
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async => _firestore
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
