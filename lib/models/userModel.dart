import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/cartPoductModel.dart';
import 'package:lingkung/models/cartTrashModel.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/shippingModel.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ADDRESS = "address";
  static const SHIPPING = "shipping";
  static const IMAGE = "image";
  static const PHONE_NUMBER = "phoneNumber";
  static const BALANCE = "balance";
  static const POINT = "point";
  static const WEIGHT = "weight";
  static const CART_PRODUCT = "cartProduct";
  static const CART_TRASH = "cartTrash";

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
  List<CartProductModel> cartProduct;
  List<CartTrashModel> carTrash;
  List<AddressModel> addressModel;
  List<ShippingModel> shippingModel;
  // ShippingModel shippingModel;
  int totalCartPriceTrash;

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
    (snapshot.data[SHIPPING] != null)
        ? shippingModel = convertShipping(snapshot.data[SHIPPING])
        : shippingModel = [];
    // (snapshot.data[SHIPPING] != null)
    //     ? shippingModel = ShippingModel.fromMap(snapshot.data[SHIPPING])
    //     : shippingModel = snapshot.data[SHIPPING];
    _image = snapshot.data[IMAGE];
    _phoNumber = snapshot.data[PHONE_NUMBER];
    _balance = snapshot.data[BALANCE];
    _point = snapshot.data[POINT];
    _weight = snapshot.data[WEIGHT];
    (snapshot.data[CART_PRODUCT] != null)
        ? cartProduct = convertCartProducts(snapshot.data[CART_PRODUCT])
        : cartProduct = [];
    (snapshot.data[CART_TRASH] != null)
        ? carTrash = convertCarTrashs(snapshot.data[CART_TRASH])
        : carTrash = [];
    totalCartPriceTrash = snapshot.data[CART_TRASH] == null
        ? 0
        : getTotalPriceTrash(cart: snapshot.data[CART_TRASH]);
  }

  int getTotalPriceTrash({List cart}) {
    if (cart == null) {
      return 0;
    }

    for (Map carTrash in cart) {
      _priceSum += carTrash["price"] * carTrash["weight"];
    }

    int total = _priceSum;
    return total;
  }

  List<AddressModel> convertAddress(List addressList) {
    List<AddressModel> convertedAddress = [];
    for (Map address in addressList) {
      convertedAddress.add(AddressModel.fromMap(address));
    }
    return convertedAddress;
  }
  
  List<ShippingModel> convertShipping(List shippingList) {
    List<ShippingModel> convertedShipping = [];
    for (Map shipping in shippingList) {
      convertedShipping.add(ShippingModel.fromMap(shipping));
    }
    return convertedShipping;
  }

  List<CartProductModel> convertCartProducts(List cart) {
    List<CartProductModel> convertedCart = [];
    for (Map cartProduct in cart) {
      convertedCart.add(CartProductModel.fromMap(cartProduct));
    }
    return convertedCart;
  }
  
  List<CartTrashModel> convertCarTrashs(List cart) {
    List<CartTrashModel> convertedCart = [];
    for (Map carTrash in cart) {
      convertedCart.add(CartTrashModel.fromMap(carTrash));
    }
    return convertedCart;
  }
}
