import 'package:cloud_firestore/cloud_firestore.dart';

class ShippingPartnerModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE_PATH = "imagePath";
  static const IS_CHECK = "isCheck";

  String _id;
  String _name;
  String _imagePath;
  bool _isCheck;
  
  //  getters
  String get id => _id;
  String get name => _name;
  String get imagePath => _imagePath;
  bool get isCheck => _isCheck;

  set isCheck(bool value) {
    if (value == null) {
      throw new ArgumentError();
    }
    _isCheck = value;
  }

  ShippingPartnerModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _imagePath = snapshot.data[IMAGE_PATH];
    _isCheck = snapshot.data[IS_CHECK];
  }
}

