import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{
  static const ID = "id";
  static const USER_ID = "userId";
  static const STORE_OWNER_ID = "storeOwnerId";
  static const ADDRESS = "address";
  static const LIST_PRODUCT = "listProduct";
  static const NOTE = "note";
  static const SUB_TOTAL = "subTotal";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _userId;
  String _storeOwnerId;
  String _note;
  int _subTotal;
  int _total;
  String _status;
  int _createdAt;

//  getters
  String get id => _id;
  String get userId => _userId;
  String get storeOwnerId => _storeOwnerId;
  String get note => _note;
  int get subTotal => _subTotal;
  int get total => _total;
  String get status => _status;
  int get createdAt => _createdAt;

// public variable
  List listProduct;
  List address;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _userId = snapshot.data[USER_ID];
    _storeOwnerId = snapshot.data[STORE_OWNER_ID];
    address = snapshot.data[ADDRESS];
    listProduct = snapshot.data[LIST_PRODUCT];
    _note = snapshot.data[NOTE];
    _subTotal = snapshot.data[SUB_TOTAL];
    _total = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
  }
}