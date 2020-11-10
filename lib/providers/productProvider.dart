import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/services/productService.dart';

class ProductProvider with ChangeNotifier{
  ProductServices _productService = ProductServices();
  ProductModel _productModel;
  List<ProductModel> products = [];
  List<ProductModel> productByUser = [];

  // Getter
  ProductModel get productModel => _productModel;

  ProductProvider.initialize(){
    loadProduct();
  }

  loadProduct() async {
    products = await _productService.getProduct();
    notifyListeners();
  }

  loadSingleProduct({String productId}) async{
    _productModel = await _productService.getProductById(id: productId);
    notifyListeners();
  }

  loadProductByUser(String userId)async{
    productByUser = await _productService.getProductByUser(userId: userId);
    notifyListeners();
  }

  Future<void> addProduct({String images, String name, int stock, int price, String description, String userId, String userName}) async {
    try {
      var uuid = Uuid();
      String productId = uuid.v4();
      Map<String, dynamic> product = {
        "id": productId,
        "images": images,
        "name": name,
        "stock": stock,
        "price": price,
        "description": description,
        "userId": userId,
        "userName": userName,
        "isCheck": false,
      };
      
      _productService.addProduct(data: product);

      print("USER ID IS: ${userId.toString()}");
      print("PRODUCT IS: ${product.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  Future<void> updateProduct({String productId, String images, String name, int stock, int price, String description, String userId, String userName}) async {
    try {
      
      Map<String, dynamic> product = {
        "id": productId,
        "images": images,
        "name": name,
        "stock": stock,
        "price": price,
        "description": description,
        "userId": userId,
        "userName": userName,
        "isCheck": false,
      };
      
      _productService.updateProduct(data: product);

      print("USER ID IS: ${userId.toString()}");
      print("PRODUCT IS: ${product.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }
}