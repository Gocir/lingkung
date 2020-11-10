import 'package:flutter/material.dart';
import 'package:lingkung/models/trashCartModel.dart';
import 'package:lingkung/models/trashReceiveModel.dart';
import 'package:lingkung/services/trashCartService.dart';
import 'package:uuid/uuid.dart';

class TrashCartProvider with ChangeNotifier {
  TrashCartServices _trashCartService = TrashCartServices();
  TrashCartModel _trashCartModel;
  List<TrashCartModel> trashCarts = [];
  List<TrashCartModel> trashCartByUser = [];
  List<TrashCartModel> trashCartByReceive = [];
  List<String> documents = [];
  int _profit;
  num _profitTotal = 0;

  // Getter
  TrashCartModel get trashCartModel => _trashCartModel;
  int get profit => _profit;
  int get profitTotal => _profitTotal;
  
  TrashCartProvider.initialize() {
    loadTrashCart();
    // getProfit();
  }
  
  loadTrashCart() async {
    trashCarts = await _trashCartService.getTrashCarts();
    notifyListeners();
  }

  getProfitTotal(num profit, num earth, num deliveryCosts) async {
    _profitTotal = profit - earth - deliveryCosts;
  }

  getProfit(String userId) async{
    _profit = await _trashCartService.getProfit(userId: userId);
    notifyListeners();
  }

  loadTrashCartByDoc(String userId, String docId) async {
    _trashCartModel =
        await _trashCartService.getTrashCartByDoc(userId: userId, docId: docId);
  }

  loadTrashByReceive(String userId, String trashTypeId) async {
    trashCartByReceive =
        await _trashCartService.getTrashCartByReceive(trashTypeId: trashTypeId);
  }
  
  loadTrashCartByUser(String userId) async {
    trashCartByUser =
        await _trashCartService.getTrashCartByUser(userId: userId);
        notifyListeners();
  }

  getDocument(String userId) async {
    documents = await _trashCartService.getDocument(userId: userId);
    notifyListeners();
  }

  Future<void> addTrashCart({String userId, TrashReceiveModel trashReceiveModel}) async {
    try {
      var uuid = Uuid();
      String trashCartId = uuid.v4();
      Map<String, dynamic> trashCart = {
        "id": trashCartId,
        "trashTypeId": trashReceiveModel.id,
        "image": trashReceiveModel.image,
        "name": trashReceiveModel.trashName,
        "price": trashReceiveModel.price,
        "weight": 1,
        "userId": userId,
        "partnerId": trashReceiveModel.partnerId
      };
      
      _trashCartService.addTrashCart(userId: userId, documentId: trashCartId, data: trashCart);

      print("USER ID IS: ${userId.toString()}");
      print("CART ITEM IS: ${trashCart.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  Future<void> updateItemWeight({String userId, String status, TrashCartModel trashCartModel}) async {
    try {
      
      Map<String, dynamic> trashCart = {
        "id": trashCartModel.id,
        "trashTypeId": trashCartModel.trashTypeId,
        "userId": userId,
        "partnerId": trashCartModel.partnerId,
        "image": trashCartModel.image,
        "name": trashCartModel.name,
        "price": trashCartModel.price,
        "weight": (status == "Increment") ? trashCartModel.weight + 1 : trashCartModel.weight -1
      };
      
      _trashCartService.updateTrashCart(userId: userId, data: trashCart);

      // print("USER ID IS: ${userId.toString()}");
      // print("CART ITEM IS: ${trashCart.toString()}");
      print("UPDATE WEIGHT IS: ${trashCart.values.firstWhere((v) => trashCart[v] == 'weight').toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }
}
