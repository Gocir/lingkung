import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/cartItemModel.dart';
import 'package:lingkung/models/addressModel.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ADDRESS = "address";
  static const IMAGE = "image";
  static const PHONE_NUMBER = "phoneNumber";
  static const BALANCE = "balance";
  static const POINT = "point";
  static const WEIGHT = "weight";
  static const CART_PRODUCT = "cartProduct";

  String _id;
  String _name;
  String _email;
  String _image;
  int _phoNumber;
  int _balance;
  int _point;
  int _weight;
  int _priceSum = 0;

  //  public variable
  List<CartItemModel> cartProduct;
  List<AddressModel> addressModel;
  int totalCartPrice;

  //  getters
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get image => _image;
  int get phoNumber => _phoNumber;
  int get balance => _balance;
  int get point => _point;
  int get weight => _weight;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    (snapshot.data[ADDRESS] != null)
        ? addressModel = convertAddress(snapshot.data[ADDRESS])
        : addressModel = [];
    // addressModel = convertAddress(snapshot.data[CART_PRODUCT]);
    _image = snapshot.data[IMAGE];
    _phoNumber = snapshot.data[PHONE_NUMBER];
    _balance = snapshot.data[BALANCE];
    _point = snapshot.data[POINT];
    _weight = snapshot.data[WEIGHT];
    (snapshot.data[CART_PRODUCT] != null)
        ? cartProduct = convertCartItems(snapshot.data[CART_PRODUCT])
        : cartProduct = [];
    totalCartPrice = snapshot.data[CART_PRODUCT] == null
        ? 0
        : getTotalPrice(cart: snapshot.data[CART_PRODUCT]);
  }

  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }

    int total = _priceSum;

    // print("THE TOTAL IS $total");

    return total;
  }

  List<AddressModel> convertAddress(List addressList) {
    List<AddressModel> convertedAddress = [];
    for (Map address in addressList) {
      convertedAddress.add(AddressModel.fromMap(address));
    }
    return convertedAddress;
  }

  List<CartItemModel> convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
