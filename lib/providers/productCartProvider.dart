import 'package:flutter/material.dart';
import 'package:lingkung/models/productCartModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/services/productCartService.dart';
import 'package:uuid/uuid.dart';

class ProductCartProvider with ChangeNotifier {
  ProductCartServices _productCartService = ProductCartServices();
  ProductCartModel _productCartModel;
  List<ProductCartModel> productCarts = [];
  List<ProductCartModel> productCartByUser = [];
  List<ProductCartModel> productCartByCart = [];
  List<String> documents = [];
  int _total;

  // Getter
  ProductCartModel get productCartModel => _productCartModel;
  int get total => _total;
  
  ProductCartProvider.initialize() {
    loadProductCart();
    // getProfit();
  }
  
  loadProductCart() async {
    productCarts = await _productCartService.getProductCarts();
    notifyListeners();
  }


  getTotal(String userId) async{
    _total = await _productCartService.getTotal(userId: userId);
    notifyListeners();
  }

  loadProductCartByDoc(String userId, String docId) async {
    _productCartModel =
        await _productCartService.getProductCartByDoc(userId: userId, docId: docId);
  }

  // loadProductByCart(String userId, String productTypeId) async {
  //   productCartByCart =
  //       await _productCartService.getProductCartByCart(productTypeId: productTypeId);
  // }
  
  loadProductCartByUser(String userId) async {
    productCartByUser =
        await _productCartService.getProductCartByUser(userId: userId);
        notifyListeners();
  }

  getDocument(String userId) async {
    documents = await _productCartService.getDocument(userId: userId);
    notifyListeners();
  }

  Future<void> addProductCart({String userId, int quantity, ProductModel productModel}) async {
    try {
      var uuid = Uuid();
      String productCartId = uuid.v4();
      Map<String, dynamic> productCart = {
        "id": productCartId,
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
      };
      
      _productCartService.addProductCart(userId: userId, data: productCart);

      print("USER ID IS: ${userId.toString()}");
      print("CART ITEM IS: ${productCart.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  Future<void> updateItemQuantity({String userId, String status, ProductCartModel productCartModel}) async {
    try {
      
      Map<String, dynamic> productCart = {
        "id": productCartModel.id,
        "productId": productCartModel.productId,
        "image": productCartModel.image,
        "name": productCartModel.name,
        "price": productCartModel.price,
        "quantity": (status == "Increment") ? productCartModel.quantity + 1 : productCartModel.quantity -1,
        "storeOwnerId": productCartModel.storeOwnerId,
        "storeOwnerName": productCartModel.storeOwnerName,
        "totalSaleProduct": productCartModel.price * productCartModel.quantity,
        "isCheck": false,
      };
      
      _productCartService.updateProductCart(userId: userId, data: productCart);

      // print("USER ID IS: ${userId.toString()}");
      // print("CART ITEM IS: ${productCart.toString()}");
      print("UPDATE WEIGHT IS: ${productCart.values.firstWhere((v) => productCart[v] == 'quantity').toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }
}
