import 'package:flutter/material.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/services/orderService.dart';

class OrderProvider with ChangeNotifier{
  OrderServices _orderService = OrderServices();
  OrderModel _orderModel;
  List<OrderModel> orders = [];
  List<OrderModel> orderByUser = [];
  List<OrderModel> orderByStatus = [];

  // Getter
  OrderModel get orderModel => _orderModel;

  OrderProvider.initialize(){
    loadOrder();
  }

  loadOrder() async {
    orders = await _orderService.getOrder();
    notifyListeners();
  }

  loadSingleOrder({String orderId}) async{
    _orderModel = await _orderService.getOrderById(id: orderId);
    notifyListeners();
  }

  loadOrderByUser(String userId)async{
    orderByUser = await _orderService.getUserOrders(userId: userId);
    notifyListeners();
  }
  
  loadOrderByStatus(String status)async{
    orderByStatus = await _orderService.getOrderByStatus(status: status);
    notifyListeners();
  }

}