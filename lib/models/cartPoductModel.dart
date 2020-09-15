class CartProductModel {
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const STORE_OWNER_ID = "storeOwnerId";
  static const TOTAL_SALE_PRODUCT = "totalSaleProduct";
  static const IS_CHECK = "isCheck";

  String _id;
  String productId;
  String _image;
  String _name;
  int _price;
  int quantity;
  String _storeOwnerId;
  int _totalSaleProduct;
  bool _isCheck;

  CartProductModel(
      {this.productId,
      this.quantity});

  //  getters
  String get id => _id;
  String get productUid => productId;
  String get image => _image;
  String get name => _name;
  int get price => _price;
  int get quantities => quantity;
  String get storeOwnerId => _storeOwnerId;
  int get totalSaleProduct => _totalSaleProduct;
  bool get isCheck => _isCheck;

  set isCheck(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isCheck = value;
  }

  CartProductModel.fromMap(Map data) {
    _id = data[ID];
    productId = data[PRODUCT_ID];
    _image = data[IMAGE];
    _name = data[NAME];
    _price = data[PRICE];
    quantity = data[QUANTITY];
    _storeOwnerId = data[STORE_OWNER_ID];
    _totalSaleProduct = data[TOTAL_SALE_PRODUCT];
    _isCheck = data[IS_CHECK];
  }

  Map toMap() => {
        ID: _id,
        PRODUCT_ID: productId,
        IMAGE: _image,
        NAME: _name,
        PRICE: _price,
        QUANTITY: quantity,
        STORE_OWNER_ID: _storeOwnerId,
        TOTAL_SALE_PRODUCT: _totalSaleProduct,
        IS_CHECK: _isCheck
      };
}
