import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';

class PartnerModel{
  static const ID = "uid";
  static const BUSINESS_NAME = "businessName";
  static const EMAIL = "email";
  static const ADDRESS = "address";
  static const IMAGE = "image";
  static const PHONE_NUMBER_LOGIN = "phoneNumberLogin";

  String _id;
  String _businessName;
  String _email;
  String _address;
  String _image;
  String _phoNumber;

//  getters
  String get id => _id;
  String get businessName => _businessName;
  String get email => _email;
  String get image => _image;
  String get address => _address;
  String get phoNumber => _phoNumber;

  //  public variable
  AddressModel addressModel;

  PartnerModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _businessName = snapshot.data[BUSINESS_NAME];
    _email = snapshot.data[EMAIL];
    (snapshot.data[ADDRESS] != null)
        ? addressModel = AddressModel.fromMap(snapshot.data[ADDRESS])
        : addressModel = snapshot.data[ADDRESS];
    _image = snapshot.data[IMAGE];
    _phoNumber = snapshot.data[PHONE_NUMBER_LOGIN];
  }

}