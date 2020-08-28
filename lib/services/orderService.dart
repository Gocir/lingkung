import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/models/shippingModel.dart';

class OrderServices {
  String collection = "productorders";
  Firestore _firestore = Firestore.instance;

  void createOrder(
      {String userId,
      String id,
      List<AddressModel> address,
      ShippingModel shipping,
      String note,
      String status,
      List<CartItemModel> listProduct,
      int subTotal,
      int total
      }) {
    List<Map> convertedCart = [];
    List<Map> convertedAddress = [];
    List<String> storeOwnerUid = [];

    for (CartItemModel cartItem in listProduct) {
      convertedCart.add(cartItem.toMap());
      storeOwnerUid.add(cartItem.storeOwnerId);
    }
    
    for (AddressModel addressItem in address) {
      convertedAddress.add(addressItem.toMap());
    }
    
    // for (ShippingModel addressItem in shipping) {
    //   convertedShipping.add(addressItem.toMap());
    // }

    _firestore.collection(collection).document(id).setData({
      "id": id,
      "userId": userId,
      "storeOwnerId": storeOwnerUid,
      "address": convertedAddress,
      "listProduct": convertedCart,
      "shipping": shipping,
      "subTotal": subTotal,
      "total": total,
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
