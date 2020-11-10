import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  static const ID = "id";
  static const USER_ID = "userId";
  static const ADDRESS_LABEL = "addressLabel";
  static const RECIPIENTS_NAME = "recipientsName";
  static const PHONE_NUMBER = "phoneNumber";
  static const PROVINCE = "province";
  static const CITY = "city";
  static const SUB_DISTRICT = "subDistrict";
  static const POSTAL_CODE = "postalCode";
  static const ADDRESS_DETAIL = "addressDetail";
  static const LOCATION_BENCHMARKS = "locationBenchmarks";
  static const LATITUDE = "latitude";
  static const LONGITUDE = "longitude";
  static const IS_PRIMARY = "isPrimary";
  static const IS_CHECK = "isCheck";

  String _id;
  String _userId;
  String _addressLabel;
  String _recipientsName;
  String _phoneNumber;
  String _province;
  String _city;
  String _subDistrict;
  int _postalCode;
  String _addressDetail;
  String _locationBenchmarks;
  String _latitude;
  String _longitude;
  bool _isPrimary;
  bool _isCheck;

  //  getters
  String get id => _id;
  String get userId => _userId;
  String get addressLabel => _addressLabel;
  String get recipientsName => _recipientsName;
  String get phoneNumber => _phoneNumber;
  String get province => _province;
  String get city => _city;
  String get subDistrict => _subDistrict;
  int get postalCode => _postalCode;
  String get addressDetail => _addressDetail;
  String get locationBenchmarks => _locationBenchmarks;
  String get latitude => _latitude;
  String get longitude => _longitude;
  bool get isPrimary => _isPrimary;
  bool get isCheck => _isCheck;

  set isPrimary(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isPrimary = value;
  }

  set isCheck(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isCheck = value;
  }

  AddressModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _userId = snapshot.data[USER_ID];
    _addressLabel = snapshot.data[ADDRESS_LABEL];
    _recipientsName = snapshot.data[RECIPIENTS_NAME];
    _phoneNumber = snapshot.data[PHONE_NUMBER];
    _province = snapshot.data[PROVINCE];
    _city = snapshot.data[CITY];
    _subDistrict = snapshot.data[SUB_DISTRICT];
    _postalCode = snapshot.data[POSTAL_CODE];
    _addressDetail = snapshot.data[ADDRESS_DETAIL];
    _locationBenchmarks = snapshot.data[LOCATION_BENCHMARKS];
    _latitude = snapshot.data[LATITUDE];
    _longitude = snapshot.data[LONGITUDE];
    _addressDetail = snapshot.data[ADDRESS_DETAIL];
    _isPrimary = snapshot.data[IS_PRIMARY];
    _isCheck = snapshot.data[IS_CHECK];
  }
  
  AddressModel.fromMap(Map data) {
    _locationBenchmarks = data[LOCATION_BENCHMARKS];
    _latitude = data[LATITUDE];
    _longitude = data[LONGITUDE];
    _addressDetail = data[ADDRESS_DETAIL];
  }

  Map toMap() => {
    LOCATION_BENCHMARKS : _locationBenchmarks,
    LATITUDE : _latitude,
    LONGITUDE : _longitude,
    ADDRESS_DETAIL : _addressDetail
  };
}
