class CartItemModel {
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const STORE_OWNER_ID = "storeOwnerId";
  static const TOTAL_SALE_PRODUCT = "totalSaleProduct";

  String _id;
  String _productId;
  String _image;
  String _name;
  int _price;
  int _quantity;
  String _storeOwnerId;
  int _totalSaleProduct;

  //  getters
  String get id => _id;
  String get productId => _productId;
  String get image => _image;
  String get name => _name;
  int get price => _price;
  int get quantity => _quantity;
  String get storeOwnerId => _storeOwnerId;
  int get totalSaleProduct => _totalSaleProduct;

  CartItemModel.fromMap(Map data){
    _id = data[ID];
    _productId = data[PRODUCT_ID];
    _image = data[IMAGE];
    _name = data[NAME];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _storeOwnerId = data[STORE_OWNER_ID];
    _totalSaleProduct = data[TOTAL_SALE_PRODUCT];
  }

  Map toMap() => {
    ID: _id,
    PRODUCT_ID: _productId,
    IMAGE: _image,
    NAME: _name,
    PRICE: _price,
    QUANTITY: _quantity,
    STORE_OWNER_ID: _storeOwnerId,
    TOTAL_SALE_PRODUCT: _totalSaleProduct,
  };
}