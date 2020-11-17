import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:lingkung/models/productOrderModel.dart';
import 'package:lingkung/models/productCartModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/services/productOrderService.dart';

class ProductOrderProvider with ChangeNotifier{
  ProductOrderServices _orderService = ProductOrderServices();
  List<ProductOrderModel> orders = [];
  List<ProductOrderModel> salesOwnerNYP = [];
  List<ProductOrderModel> salesOwnerPacked = [];
  List<ProductOrderModel> salesOwnerSent = [];
  List<ProductOrderModel> salesOwnerFinish = [];
  List<ProductOrderModel> orderNYP = [];
  List<ProductOrderModel> orderPacked = [];
  List<ProductOrderModel> orderSent = [];
  List<ProductOrderModel> orderFinish = [];

  ProductOrderProvider.initialize(){
    loadOrder();
  }

  Future<void> updateProductOrders(
      {String productOrdersId,
      String userId,
      String storeOwnerId,
      String storeOwnerName,
      String address,
      String shipping,
      int shippingPrice,
      String note,
      List<ProductCartModel> productCartModel,
      int quantity,
      int subTotalProduct,
      int total,
      String resi,
      String status,
      int createdAt,
      }) async {
    List<Map> convertedCart = [];

    try {
      for (ProductCartModel productCart in productCartModel) {
        convertedCart.add(productCart.toMap());
      }

      Map<String, dynamic> product = {
        "id": productOrdersId,
        "userId": userId,
        "storeOwnerId": storeOwnerId,
        "storeOwnerName": storeOwnerName,
        "address": address,
        "listProduct": convertedCart,
        "shipping": shipping,
        "shippingPrice": shippingPrice,
        "subTotalProduct": subTotalProduct,
        "total": total,
        "note": note,
        "resi": resi,
        "status": status,
        "createdAt": createdAt,
        "ordersSent": DateTime.now().millisecondsSinceEpoch,
      };
      
      _orderService.updateProductOrder(data: product);

      print("USER ID IS: ${userId.toString()}");
      print("PRODUCT IS: ${product.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }
  
  Future<void> addProductOrders(
      {String userId,
      String address,
      String shipping,
      int shippingPrice,
      String note,
      ProductModel productModel,
      int quantity,
      // List<ProductCartModel> listProduct,
      int subTotalProduct,
      int total,
      String status,
      }) async {
    // List<Map> convertedCart = [];
    // for (ProductCartModel productCart in listProduct) {
    //     convertedCart.add(productCart.toMap());
    //   }

    try {
      var uuid = Uuid();
      String productOrdersId = uuid.v4();
      String productListId = uuid.v4();
      
      List<Map> convertListProduct = [{
        "id": productListId,
        "productId": productModel.id,
        "image": productModel.image,
        "name": productModel.name,
        "price": productModel.price,
        "quantity": quantity,
        "storeOwnerId": productModel.userId,
        "storeOwnerName": productModel.userName,
        "totalSaleProduct": productModel.price * quantity,
        "isCheck": false,
        "userId": userId,
      }];

      Map<String, dynamic> product = {
        "id": productOrdersId,
        "userId": userId,
        "storeOwnerId": productModel.userId,
        "storeOwnerName": productModel.userName,
        "address": address,
        "listProduct": convertListProduct,
        "shipping": shipping,
        "shippingPrice": shippingPrice,
        "subTotalProduct": subTotalProduct,
        "total": total,
        "note": note,
        "status": status,
        "createdAt": DateTime.now().millisecondsSinceEpoch
      };
      
      _orderService.addProductOrder(data: product);

      print("USER ID IS: ${userId.toString()}");
      print("PRODUCT IS: ${product.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  loadOrder() async {
    orders = await _orderService.getOrder();
    notifyListeners();
  }

  loadOrderNYP(String userId) async {
    orderNYP = await _orderService.getUserOrderByStatus(userId: userId, status: "Belum Bayar");
    notifyListeners();
  }

  loadOrderPacked(String userId) async {
    orderPacked = await _orderService.getUserOrderByStatus(userId: userId, status: "Dikemas");
    notifyListeners();
  }

  loadOrderSent(String userId) async {
    orderSent = await _orderService.getUserOrderByStatus(userId: userId, status: "Dikirim");
    notifyListeners();
  }
  
  loadOrderFinish(String userId) async {
    orderFinish = await _orderService.getUserOrderByStatus(userId: userId, status: "Selesai");
    notifyListeners();
  }
  
  loadSalesOwnerNYP(String userId) async{
    salesOwnerNYP = await _orderService.getOrderByOwners(userId: userId, status: "Belum Bayar");
    notifyListeners();
  }
  
  loadSalesOwnerPacked(String userId) async{
    salesOwnerPacked = await _orderService.getOrderByOwners(userId: userId, status: "Dikemas");
    notifyListeners();
  }
  
  loadSalesOwnerSent(String userId) async{
    salesOwnerSent = await _orderService.getOrderByOwners(userId: userId, status: "Dikirim");
    notifyListeners();
  }
  
  loadSalesOwnerFinish(String userId) async{
    salesOwnerFinish = await _orderService.getOrderByOwners(userId: userId, status: "Selesai");
    notifyListeners();
  }
  
}