import 'package:flutter/material.dart';
import 'package:lingkung/models/productOrderModel.dart';
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