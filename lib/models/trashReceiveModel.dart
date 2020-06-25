import 'package:cloud_firestore/cloud_firestore.dart';

class TrashReceiveModel{
  static const ID = "id";
  static const TRASH_NAME = "trashName";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const PARTNER_ID = "partnerId";

  String _id;
  String _trashName;
  int _price;
  String _image;
  String _partnerId;

//  getters
  String get id => _id;
  String get trashName => _trashName;
  int get price => _price;
  String get image => _image;
  String get partnerId => _partnerId;

  TrashReceiveModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _trashName = snapshot.data[TRASH_NAME];
    _price = snapshot.data[PRICE];
    _image = snapshot.data[IMAGE];
    _partnerId = snapshot.data[PARTNER_ID];
  }

}