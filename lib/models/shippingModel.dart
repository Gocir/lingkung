class ShippingModel {
  static const ID = "id";
  static const NAME = "name";
  static const DURATION = "duration";
  static const TYPE = "type";
  static const PRICE = "price";
  // static const IMAGE_PATH = "imagePath";

  String _id;
  String _name;
  String _duration;
  String _type;
  int _price;
  // String _imagePath;
  
  //  getters
  String get id => _id;
  String get name => _name;
  String get duration => _duration;
  String get type => _type;
  int get price => _price;
  // String get imagePath => _imagePath;
  // bool get isCheck => _isCheck;

  // set isCheck(bool value) {
  //   if (value == null) {
  //     throw new ArgumentError();
  //   }
  //   _isCheck = value;
  // }

  ShippingModel.fromMap(Map data) {
    _id = data[ID];
    _name = data[NAME];
    _duration = data[DURATION];
    _type = data[TYPE];
    _price = data[PRICE];
    // _imagePath = data[IMAGE_PATH];
  }

  Map toMap() => {
    ID : _id,
    NAME : _name,
    DURATION : _duration,
    TYPE : _type,
    PRICE : _price,
    // IMAGE_PATH : _imagePath,
  };
}

