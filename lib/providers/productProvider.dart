import 'package:flutter/material.dart';
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

}