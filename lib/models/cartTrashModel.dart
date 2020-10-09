class CartTrashModel {
  static const ID = "id";
  static const TRASH_TYPE_ID = "trashTypeId";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const WEIGHT = "weight";
  static const PARTNER_ID = "partnerId";

  String _id;
  String trashTypeUid;
  String _image;
  String _name;
  int _weight;
  int _price;
  String _partnerId;

  //  getters
  String get id => _id;
  String get trashTypeId => trashTypeUid;
  String get image => _image;
  String get name => _name;
  int get weight => _weight;
  int get price => _price;
  String get partnerId => _partnerId;

  set weight(int value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _weight = value;
  }

  CartTrashModel.fromMap(Map data) {
    _id = data[ID];
    trashTypeUid = data[TRASH_TYPE_ID];
    _image = data[IMAGE];
    _name = data[NAME];
    _price = data[PRICE];
    _weight = data[WEIGHT];
    _partnerId = data[PARTNER_ID];
  }

  Map toMap() => {
        ID: _id,
        TRASH_TYPE_ID: trashTypeUid,
        IMAGE: _image,
        NAME: _name,
        PRICE: _price,
        WEIGHT: _weight,
        PARTNER_ID: _partnerId,
      };
}
