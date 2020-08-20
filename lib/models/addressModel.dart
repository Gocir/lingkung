class AddressModel {
  static const ID = "id";
  static const ADDRESS_LABEL = "addressLabel";
  static const RECIPIENTS_NAME = "recipientsName";
  static const PHONE_NUMBER = "phoNumber";
  static const PROVINCE = "province";
  static const CITY = "city";
  static const SUB_DISTRICT = "subDistrict";
  static const POS_CODE = "posCode";
  static const ADDRESS_DETAIL = "addressDetail";
  static const IS_CHECK = "isCheck";

  String _id;
  String _addressLabel;
  String _recipientsName;
  int _phoNumber;
  String _province;
  String _city;
  String _subDistrict;
  int _posCode;
  String _addressDetail;
  bool _isCheck;

  //  getters
  String get id => _id;
  String get addressLabel => _addressLabel;
  String get recipientsName => _recipientsName;
  int get phoNumber => _phoNumber;
  String get province => _province;
  String get city => _city;
  String get subDistrict => _subDistrict;
  int get posCode => _posCode;
  String get addressDetail => _addressDetail;
  bool get isCheck => _isCheck;

  set isCheck(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isCheck = value;
  }

  AddressModel.fromMap(Map data) {
    _id = data[ID];
    _addressLabel = data[ADDRESS_LABEL];
    _recipientsName = data[RECIPIENTS_NAME];
    _phoNumber = data[PHONE_NUMBER];
    _province = data[PROVINCE];
    _city = data[CITY];
    _subDistrict = data[SUB_DISTRICT];
    _posCode = data[POS_CODE];
    _addressDetail = data[ADDRESS_DETAIL];
    _isCheck = data[IS_CHECK];
  }

  Map toMap() => {
    ID : _id,
    ADDRESS_LABEL : _addressLabel,
    RECIPIENTS_NAME : _recipientsName,
    PHONE_NUMBER : _phoNumber,
    PROVINCE : _province,
    CITY : _city,
    SUB_DISTRICT : _subDistrict,
    POS_CODE : _posCode,
    ADDRESS_DETAIL : _addressDetail,
    IS_CHECK : _isCheck
  };
}
