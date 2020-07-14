import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ADDRESS = "address";
  static const IMAGE = "image";
  static const PHONE_NUMBER = "phoneNumber";
  static const CART = "cart";

  String _id;
  String _name;
  String _email;
  String _address;
  String _image;
  int _phoNumber;
  List<String> _cart;

//  getters
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get image => _image;
  String get address => _address;
  int get phoNumber => _phoNumber;
  List<String> get cart => _cart;

//  public variable

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _address = snapshot.data[ADDRESS];
    _image = snapshot.data[IMAGE];
    _phoNumber = snapshot.data[PHONE_NUMBER];
  }

}