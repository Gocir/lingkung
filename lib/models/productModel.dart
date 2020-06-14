import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  static const ID = "id";
  static const NAME = "name";
  static const STOCK = "stock";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const IMAGE = "image";

  String _id;
  String _name;
  int _stock;
  int _price;
  String _description;
  String _image;

//  getters
  String get id => _id;
  String get name => _name;
  int get stock => _stock;
  int get price => _price;
  String get description => _description;
  String get image => _image;

//  named constructure
  Product.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data;
    _id = data[NAME];
    _name = data[NAME];
    _stock = data[STOCK];
    _price = data[PRICE];
    _description = data[DESCRIPTION];
    _image = data[IMAGE];
  }
}