import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/models/shippingModel.dart';
import 'package:uuid/uuid.dart';

class OrderServices {
  String collection = "productOrders";
  Firestore _firestore = Firestore.instance;

  void createOrder(
      {String userId,
      String id,
      AddressModel address,
      ShippingModel shipping,
      int shippingPrice,
      String note,
      ProductModel productModel,
      int quantity,
      List<CartItemModel> listProduct,
      int subTotalProduct,
      int total,
      String status,
      }) {
    List<Map> convertedCart = [];
    Map convertedAddress = (address.toMap());
    Map convertedShipping = (shipping.toMap());
    List<String> storeOwnerUid = [];
      
    if (listProduct != null) {
      for (CartItemModel cartItem in listProduct) {
        convertedCart.add(cartItem.toMap());
        storeOwnerUid.add(cartItem.storeOwnerId);
      }

      _firestore.collection(collection).document(id).setData({
        "id": id,
        "userId": userId,
        "storeOwnerId": storeOwnerUid,
        "address": convertedAddress,
        "listProduct": convertedCart,
        "shipping": convertedShipping,
        "shippingPrice": shippingPrice,
        "subTotalProduct": subTotalProduct,
        "total": total,
        "note": note,
        "status": status,
        "createdAt": DateTime.now().millisecondsSinceEpoch
      });
    } else {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<Map> convertedProduct = [{
        "id": cartItemId,
        "productId": productModel.id,
        "image": productModel.image,
        "name": productModel.name,
        "price": productModel.price,
        "quantity": quantity,
        "storeOwnerId": productModel.userId,
        "totalSaleProduct": productModel.price * quantity,
        "isCheck": false,
      }];
      
      storeOwnerUid = [productModel.userId];
      _firestore.collection(collection).document(id).setData({
        "id": id,
        "userId": userId,
        "storeOwnerId": storeOwnerUid,
        "address": convertedAddress,
        "listProduct": convertedProduct,
        "shipping": convertedShipping,
        "shippingPrice": shippingPrice,
        "subTotalProduct": subTotalProduct,
        "total": total,
        "note": note,
        "status": status,
        "createdAt": DateTime.now().millisecondsSinceEpoch
      });
    }
    print(id + " is saved!");
  }

   Future<List<OrderModel>> getOrder() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

  Future<OrderModel> getOrderById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return OrderModel.fromSnapshot(doc);
      });
      
  Future<List<OrderModel>> getOrderByOwners({String userId, String status}) async => _firestore
          .collection(collection)
          .where("storeOwnerId", arrayContains: userId)
          .where("status", isEqualTo: status)
          .getDocuments()
          .then((result) {
        List<OrderModel> userOrders = [];
        for (DocumentSnapshot order in result.documents) {
          userOrders.add(OrderModel.fromSnapshot(order));
        }
        return userOrders;
      });
  
  Future<List<OrderModel>> getUserOrderByStatus({String userId, String status}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .where("status", isEqualTo: status)
          .getDocuments()
          .then((result) {
        List<OrderModel> orderByStatus = [];
        for (DocumentSnapshot order in result.documents) {
          orderByStatus.add(OrderModel.fromSnapshot(order));
        }
        return orderByStatus;
      });
}
