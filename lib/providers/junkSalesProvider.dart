import 'package:flutter/material.dart';
import 'package:lingkung/models/directionModel.dart';
import 'package:lingkung/models/junkSalesModel.dart';
import 'package:lingkung/models/trashCartModel.dart';
import 'package:lingkung/services/junkSalesService.dart';

class JunkSalesProvider with ChangeNotifier {
  JunkSalesServices _junkSalesService = JunkSalesServices();
  JunkSalesModel _junkSalesModel;
  List<JunkSalesModel> junkSales = [];
  List<JunkSalesModel> userJunkSales = [];
  List<JunkSalesModel> userJunkSalesComplete = [];
  List<JunkSalesModel> junkSalesByReceive = [];
  List<TrashCartModel> listTrash = [];

  JunkSalesProvider.initialize() {
    loadJunkSales();
  }

  JunkSalesModel get junkSalesModel => _junkSalesModel;

  Future<bool> addJunkSales(
      {String junkSalesId,
      String userId,
      String userName,
      String partnerId,
      String businessName,
      String courierId,
      String courierName,
      String startPoint,
      String destination,
      List<TrashCartModel> trashCartModel,
      String locationBenchmarks,
      int profitEstimate,
      String paymentMethod,
      String trashImage,
      int earth,
      int deliveryCosts,
      int profitTotal}) async {
    
    try {
      List<Map> convertedCart = [];

      Map convertDirection = {
        "startPoint": startPoint,
        "destination": destination,
        "locationBenchmarks": locationBenchmarks
      };

      Map<String, dynamic> junkSales = {
        "id": junkSalesId,
        "userId": userId,
        "userName": userName,
        "partnerId": partnerId,
        "businessName": businessName,
        "courierId": courierId,
        "courierName": courierName,
        "direction": convertDirection,
        "profitEstimate": profitEstimate,
        "earth": earth,
        "deliveryCosts": deliveryCosts,
        "profitTotal": profitTotal,
        "paymentMethod": paymentMethod,
        "trashImage": trashImage,
        "amountTrash": trashCartModel.length,
        "status": "Start Orders",
        "orderTime": DateTime.now().millisecondsSinceEpoch
      };
      _junkSalesService.createJunkSales(junkSales: junkSales);

      for (TrashCartModel trashCart in trashCartModel) {
        Map<String, dynamic> listTrash = {
          "id": trashCart.id,
          "trashTypeId": trashCart.trashTypeId,
          "partnerId": trashCart.partnerId,
          "junkSalesId": junkSalesId,
          "image": trashCart.image,
          "name": trashCart.name,
          "price": trashCart.price,
          "weight": trashCart.weight
        };
        convertedCart.add(listTrash);
      }
      for (int i=0; i<convertedCart.length; i++){
        _junkSalesService.addlistTrash(junkSalesId: junkSalesId, listTrash: convertedCart[i]);
      }

      print("USER ID IS: ${userId.toString()}");
      print("DIRECTION IS: ${convertDirection.toString()}");
      print("JUNK SALES IS: ${junkSales.toString()}");
      print("LIST TRASH IS: ${convertedCart.toString()}");
      notifyListeners();
      return true;
    } catch (e) {
      print(e.toString());
      notifyListeners();
      return false;
    }
  }

  Future<void> updateJunkSales(
      {String status, DirectionModel directionModel, JunkSalesModel junkSalesModel}) async {
    try {

      Map convertDirection = (directionModel.toMap());
      Map<String, dynamic> junkSales = {
        "id": junkSalesModel.id,
        "userId": junkSalesModel.userId,
        "partnerId": junkSalesModel.partnerId,
        "courierId": junkSalesModel.courierId,
        "direction": convertDirection,
        "profitEstimate": junkSalesModel.profitEstimate,
        "earth": junkSalesModel.earth,
        "deliveryCosts": junkSalesModel.deliveryCosts,
        "profitTotal": junkSalesModel.profitTotal,
        "paymentMethod": junkSalesModel.paymentMethod,
        "trashImage": junkSalesModel.trashImage,
        "status": "Taken Orders",
        "orderTime": junkSalesModel.orderTime,
        "collectionTime": "",
        "deliveryTime": "",
        "orderCompleteTime": ""
      };

      _junkSalesService.createJunkSales(junkSales: junkSales);

      print("USER ID IS: ${junkSalesModel.userId.toString()}");
      print("CART ITEM IS: ${junkSales.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  Future<void> deleteJunkSales({String junkSalesId}) async {
    try {
      _junkSalesService.deleteJunkSales(junkSalesId: junkSalesId);

      print("JUNK SALES '${junkSalesId.toString()}' WAS DELETED");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  loadJunkSales() async {
    junkSales = await _junkSalesService.getJunkSales();
    notifyListeners();
  }
  
  loadSingleJunkSales(String junkSalesId) async {
    _junkSalesModel = await _junkSalesService.getJunkSalesById(junkSalesId: junkSalesId);
    notifyListeners();
  }

  loadUserJunkSales(String userId) async {
    userJunkSales = await _junkSalesService.getUserJunkSales(userId: userId);
    notifyListeners();
  }

  loadUserJunkSalesComplete(String userId) async {
    userJunkSalesComplete = await _junkSalesService.getUserJunkSalesComplete(userId: userId, status: "complete");
    notifyListeners();
  }
  
  loadListTrash(String junkSalesId) async {
    listTrash = await _junkSalesService.getListTrashById(junkSalesId: junkSalesId);
    notifyListeners();
  }

}
