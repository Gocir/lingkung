import 'package:flutter/material.dart';
import 'package:lingkung/models/orderModel.dart';
import 'package:lingkung/services/orderService.dart';

class OrderProvider with ChangeNotifier{
  OrderServices _orderService = OrderServices();
  List<OrderModel> orders = [];
  List<OrderModel> salesOwnerNYP = [];
  List<OrderModel> salesOwnerPacked = [];
  List<OrderModel> salesOwnerSent = [];
  List<OrderModel> salesOwnerFinish = [];
  List<OrderModel> orderNYP = [];
  List<OrderModel> orderPacked = [];
  List<OrderModel> orderSent = [];
  List<OrderModel> orderFinish = [];

  OrderProvider.initialize(){
    loadOrder();
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