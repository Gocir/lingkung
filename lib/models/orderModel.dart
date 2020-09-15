import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/cartPoductModel.dart';
import 'package:lingkung/models/shippingModel.dart';

class OrderModel{
  static const ID = "id";
  static const USER_ID = "userId";
  static const STORE_OWNER_ID = "storeOwnerId";
  static const ADDRESS = "address";
  static const LIST_PRODUCT = "listProduct";
  static const SHIPPING = "shipping";
  static const SHIPPING_PRICE = "shippingPrice";
  static const SUB_TOTAL_PRODUCT = "subTotalProduct";
  static const NOTE = "note";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _userId;
  // String _storeOwnerId;
  int _shippingPrice;
  int _subTotalProduct;
  String _note;
  int _total;
  String _status;
  int _createdAt;

//  getters
  String get id => _id;
  String get userId => _userId;
  // String get storeOwnerId => _storeOwnerId;
  int get shippingPrice => _shippingPrice;
  int get subTotalProduct => _subTotalProduct;
  String get note => _note;
  int get total => _total;
  String get status => _status;
  int get createdAt => _createdAt;

// public variable
  List listProduct;
  AddressModel address;
  List storeOwnerId;
  ShippingModel shipping;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _userId = snapshot.data[USER_ID];
    storeOwnerId = snapshot.data[STORE_OWNER_ID];
    (snapshot.data[ADDRESS] != null)
        ? address = AddressModel.fromMap(snapshot.data[ADDRESS])
        : address = snapshot.data[SHIPPING];
    (snapshot.data[LIST_PRODUCT] != null)
        ? listProduct = convertListProducts(snapshot.data[LIST_PRODUCT])
        : listProduct = [];
    (snapshot.data[SHIPPING] != null)
        ? shipping = ShippingModel.fromMap(snapshot.data[SHIPPING])
        : shipping = snapshot.data[SHIPPING];
    _shippingPrice = snapshot.data[SHIPPING_PRICE];
    _subTotalProduct = snapshot.data[SUB_TOTAL_PRODUCT];
    _note = snapshot.data[NOTE];
    _total = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
  }

  List<CartProductModel> convertListProducts(List product) {
    List<CartProductModel> convertedProduct = [];
    for (Map productItem in product) {
      convertedProduct.add(CartProductModel.fromMap(productItem));
    }
    return convertedProduct;
  }
}