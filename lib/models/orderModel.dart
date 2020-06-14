import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{
  static const ID = "id";
  static const NOTE = "note";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _note;
  String _userId;
  int _total;
  String _status;
  int _createdAt;

//  getters
  String get id => _id;
  String get note => _note;
  String get userId => _userId;
  String get status => _status;
  int get total => _total;
  int get createdAt => _createdAt;

  // public variable
  List cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _note = snapshot.data[NOTE];
    _total = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _userId = snapshot.data[USER_ID];
    _createdAt = snapshot.data[CREATED_AT];
    cart = snapshot.data[CART];
  }
}