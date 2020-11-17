import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCartModel {
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const STORE_OWNER_ID = "storeOwnerId";
  static const STORE_OWNER_NAME = "storeOwnerName";
  static const TOTAL_SALE_PRODUCT = "totalSaleProduct";
  static const IS_CHECK = "isCheck";
  static const USER_ID = "userId";

  String _id;
  String _productId;
  String _image;
  String _name;
  int _price;
  int _quantity;
  String _storeOwnerId;
  String _storeOwnerName;
  int _totalSaleProduct;
  bool _isCheck;
  String _userId;

  // ProductCartModel(
  //     {this.productId,
  //     this.quantity});

  //  getters
  String get id => _id;
  String get productId => _productId;
  String get image => _image;
  String get name => _name;
  int get price => _price;
  int get quantity => _quantity;
  String get storeOwnerId => _storeOwnerId;
  String get storeOwnerName => _storeOwnerName;
  int get totalSaleProduct => _totalSaleProduct;
  bool get isCheck => _isCheck;
  String get userId => _userId;

  set isCheck(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isCheck = value;
  }

  ProductCartModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _productId = snapshot.data[PRODUCT_ID];
    _image = snapshot.data[IMAGE];
    _name = snapshot.data[NAME];
    _price = snapshot.data[PRICE];
    _quantity = snapshot.data[QUANTITY];
    _storeOwnerId = snapshot.data[STORE_OWNER_ID];
    _storeOwnerName = snapshot.data[STORE_OWNER_NAME];
    _totalSaleProduct = snapshot.data[TOTAL_SALE_PRODUCT];
    _isCheck = snapshot.data[IS_CHECK];
    _userId = snapshot.data[USER_ID];
  }
  
  ProductCartModel.fromMap(Map data) {
    _id = data[ID];
    _productId = data[PRODUCT_ID];
    _image = data[IMAGE];
    _name = data[NAME];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _storeOwnerId = data[STORE_OWNER_ID];
    _storeOwnerName = data[STORE_OWNER_NAME];
    _totalSaleProduct = data[TOTAL_SALE_PRODUCT];
    _isCheck = data[IS_CHECK];
    _userId = data[USER_ID];
  }

  Map toMap() => {
    ID: _id,
    PRODUCT_ID: _productId,
    IMAGE: _image,
    NAME: _name,
    PRICE: _price,
    QUANTITY: _quantity,
    STORE_OWNER_ID: _storeOwnerId,
    STORE_OWNER_NAME: _storeOwnerName,
    TOTAL_SALE_PRODUCT: _totalSaleProduct,
    IS_CHECK: _isCheck,
    USER_ID: _userId,
  };
}
