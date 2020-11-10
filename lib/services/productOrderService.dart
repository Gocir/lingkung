import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/productCartModel.dart';
import 'package:lingkung/models/productOrderModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/models/shippingModel.dart';
import 'package:uuid/uuid.dart';

class ProductOrderServices {
  String collection = "productOrders";
  Firestore _firestore = Firestore.instance;

  // void createOrder(
  //     {String userId,
  //     String id,
  //     AddressModel address,
  //     ShippingModel shipping,
  //     int shippingPrice,
  //     String note,
  //     ProductModel productModel,
  //     int quantity,
  //     List<CartProductModel> listProduct,
  //     int subTotalProduct,
  //     int total,
  //     String status,
  //     }) {
  //   List<Map> convertedCart = [];
  //   Map convertedShipping = (shipping.toMap());
  //   List<String> storeOwnerUid = [];
      
  //   if (listProduct != null) {
  //     for (CartProductModel cartProduct in listProduct) {
  //       convertedCart.add(cartProduct.toMap());
  //       storeOwnerUid.add(cartProduct.storeOwnerId);
  //     }

  //     _firestore.collection(collection).document(id).setData({
  //       "id": id,
  //       "userId": userId,
  //       "storeOwnerId": storeOwnerUid,
  //       "address": null,
  //       "listProduct": convertedCart,
  //       "shipping": convertedShipping,
  //       "shippingPrice": shippingPrice,
  //       "subTotalProduct": subTotalProduct,
  //       "total": total,
  //       "note": note,
  //       "status": status,
  //       "createdAt": DateTime.now().millisecondsSinceEpoch
  //     });
  //   } else {
  //     var uuid = Uuid();
  //     String cartProductId = uuid.v4();
  //     List<Map> convertedProduct = [{
  //       "id": cartProductId,
  //       "productId": productModel.id,
  //       "image": productModel.image,
  //       "name": productModel.name,
  //       "price": productModel.price,
  //       "quantity": quantity,
  //       "storeOwnerId": productModel.userId,
  //       "totalSaleProduct": productModel.price * quantity,
  //       "isCheck": false,
  //     }];
      
  //     storeOwnerUid = [productModel.userId];
  //     _firestore.collection(collection).document(id).setData({
  //       "id": id,
  //       "userId": userId,
  //       "storeOwnerId": storeOwnerUid,
  //       "address": null,
  //       "listProduct": convertedProduct,
  //       "shipping": convertedShipping,
  //       "shippingPrice": shippingPrice,
  //       "subTotalProduct": subTotalProduct,
  //       "total": total,
  //       "note": note,
  //       "status": status,
  //       "createdAt": DateTime.now().millisecondsSinceEpoch
  //     });
  //   }
  //   print(id + " is saved!");
  // }

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
          .where("storeOwnerId", arrayContains: userId)
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
