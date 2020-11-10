import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const apiKey = "AIzaSyAZ-Z10mSwXVziJo8BaqCtVLSA8jAQsPms";

class AddressServices {
  String collection = "users";
  String subCollection = "Address";
  Firestore _firestore = Firestore.instance;

  void createAddress({Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(data['userId'])
        .collection(subCollection)
        .document(data['id'])
        .setData(data);
  }

  void updateAddress({Map<String, dynamic> data}) {
    _firestore
        .collection(collection)
        .document(data['userId'])
        .collection(subCollection)
        .document(data['id'])
        .updateData(data);
  }

  Future<void> deleteAddress({String userId, String docId}) async {
    _firestore
        .collection(collection)
        .document(userId)
        .collection(subCollection)
        .document(docId)
        .delete();
  }

  Future<String> getRouteCoordinates(LatLng l1, LatLng l2)async{
      String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
      http.Response response = await http.get(url);
      Map values = jsonDecode(response.body);
      return values["routes"][0]["overview_polyline"]["points"];
    }
  
  Future<List<AddressModel>> getAddress({String userId}) async =>
      _firestore.collection(collection).document(userId).collection(subCollection).getDocuments().then((result) {
        List<AddressModel> addresses = [];
        for (DocumentSnapshot address in result.documents) {
          addresses.add(AddressModel.fromSnapshot(address));
        }
        return addresses;
      });

  Future<List<String>> getDocument({String userId}) async => _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .getDocuments()
          .then((snapshot) {
        List<String> document = [];
        for (DocumentSnapshot doc in snapshot.documents) {
          document.add(doc.documentID);
        }
        return document;
      });

  Future<List<AddressModel>> getUserAddress({String userId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .where('userId', isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<AddressModel> userAddress = [];
        for (DocumentSnapshot address in result.documents) {
          userAddress.add(AddressModel.fromSnapshot(address));
        }
        return userAddress;
      });

  Future<AddressModel> getAddressByDoc(
          {String userId, String docId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .document(docId)
          .get()
          .then((doc) {
        return AddressModel.fromSnapshot(doc);
      });

  Future<List<AddressModel>> getAddressByReceive(
          {String userId, String addressId}) async =>
      _firestore
          .collection(collection)
          .document(userId)
          .collection(subCollection)
          .where("addressId", isEqualTo: addressId)
          .getDocuments()
          .then((result) {
        List<AddressModel> addressByReceives = [];
        for (DocumentSnapshot addressByReceive in result.documents) {
          addressByReceives
              .add(AddressModel.fromSnapshot(addressByReceive));
        }
        return addressByReceives;
      });
}