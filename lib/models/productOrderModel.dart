import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/productCartModel.dart';

class ProductOrderModel{
  static const ID = "id";
  static const USER_ID = "userId";
  static const STORE_OWNER_ID = "storeOwnerId";
  static const STORE_OWNER_NAME = "storeOwnerName";
  static const ADDRESS = "address";
  static const LIST_PRODUCT = "listProduct";
  static const SHIPPING = "shipping";
  static const SHIPPING_PRICE = "shippingPrice";
  static const SUB_TOTAL_PRODUCT = "subTotalProduct";
  static const NOTE = "note";
  static const TOTAL = "total";
  static const RESI = "resi";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const ORDERS_SENT = "ordersSent";

  String _id;
  String _userId;
  String _storeOwnerId;
  String _storeOwnerName;
  String _address;
  String _shipping;
  int _shippingPrice;
  int _subTotalProduct;
  String _note;
  int _total;
  String _resi;
  String _status;
  int _createdAt;
  int _ordersSent;

//  getters
  String get id => _id;
  String get userId => _userId;
  String get storeOwnerId => _storeOwnerId;
  String get storeOwnerName => _storeOwnerName;
  String get address => _address;
  String get shipping => _shipping;
  int get shippingPrice => _shippingPrice;
  int get subTotalProduct => _subTotalProduct;
  String get note => _note;
  int get total => _total;
  String get resi => _resi;
  String get status => _status;
  int get createdAt => _createdAt;
  int get ordersSent => _ordersSent;

// public variable
  List<ProductCartModel> listProduct;

  ProductOrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _userId = snapshot.data[USER_ID];
    _storeOwnerId = snapshot.data[STORE_OWNER_ID];
    _storeOwnerName = snapshot.data[STORE_OWNER_NAME];
    _address = snapshot.data[ADDRESS];
    (snapshot.data[LIST_PRODUCT] != null)
        ? listProduct = convertListProduct(snapshot.data[LIST_PRODUCT])
        : listProduct = [];
    _shipping = snapshot.data[SHIPPING];
    _shippingPrice = snapshot.data[SHIPPING_PRICE];
    _subTotalProduct = snapshot.data[SUB_TOTAL_PRODUCT];
    _note = snapshot.data[NOTE];
    _total = snapshot.data[TOTAL];
    _resi = snapshot.data[RESI];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
    _ordersSent = snapshot.data[ORDERS_SENT];
  }

  List<ProductCartModel> convertListProduct(List productList) {
    List<ProductCartModel> convertedProductCart = [];
    for (Map product in productList) {
      convertedProductCart.add(ProductCartModel.fromMap(product));
    }
    return convertedProductCart;
  }
}