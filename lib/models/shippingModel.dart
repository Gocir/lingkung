class ShippingModel {
  static const ID = "id";
  static const NAME = "name";
  static const DURATION = "duration";
  static const TYPE = "type";
  // static const IMAGE_PATH = "imagePath";
  static const IS_CHECK = "isCheck";

  String _id;
  String _name;
  String _duration;
  String _type;
  // String _imagePath;
  bool _isCheck;
  
  //  getters
  String get id => _id;
  String get name => _name;
  String get duration => _duration;
  String get type => _type;
  // String get imagePath => _imagePath;
  bool get isCheck => _isCheck;

  set isCheck(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isCheck = value;
  }

  ShippingModel.fromMap(Map data) {
    _id = data[ID];
    _name = data[NAME];
    _duration = data[DURATION];
    _type = data[TYPE];
    // _imagePath = data[IMAGE_PATH];
    _isCheck = data[IS_CHECK];
  }

  Map toMap() => {
    ID : _id,
    NAME : _name,
    DURATION : _duration,
    TYPE : _type,
    // IMAGE_PATH : _imagePath,
    IS_CHECK : _isCheck
  };
}

