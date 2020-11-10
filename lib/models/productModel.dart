import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  static const ID = "id";
  static const NAME = "name";
  static const STOCK = "stock";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const IMAGE = "images";
  static const USER_ID = "userId";
  static const USER_NAME = "userName";

  String _id;
  String _name;
  int _stock;
  int _price;
  String _description;
  String _image;
  String _userId;
  String _userName;

//  getters
  String get id => _id;
  String get name => _name;
  int get stock => _stock;
  int get price => _price;
  String get description => _description;
  String get image => _image;
  String get userId => _userId;
  String get userName => _userName;

//  named constructure
  ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _stock = snapshot.data[STOCK];
    _price = snapshot.data[PRICE];
    _description = snapshot.data[DESCRIPTION];
    _image = snapshot.data[IMAGE];
    _userId = snapshot.data[USER_ID];
    _userName = snapshot.data[USER_NAME];
  }
}