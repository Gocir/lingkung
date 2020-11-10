import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/partnerModel.dart';

class PartnerServices{

  String collection = "businessPartners";
  Firestore _firestore = Firestore.instance;

  Future<List<PartnerModel>> getPartner() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<PartnerModel> partners = [];
        for (DocumentSnapshot partner in result.documents) {
          partners.add(PartnerModel.fromSnapshot(partner));
        }
        return partners;
      });

  Future<PartnerModel> getPartnerById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
          if (doc.data == null) {
          return null;
        }
        return PartnerModel.fromSnapshot(doc);
      });

  // Future<PartnerModel> getBusinessDataById(String id) => _firestore.collection(collection).document(id).get().then((doc){
  //   return PartnerModel.fromSnapshot(doc);
  // });

  // void addToCart({String partnerId, Map cartItem}){
  //   print("THE USER ID IS: $partnerId");
  //   print("cart items are: ${cartItem.toString()}");
  //   _firestore.collection(collection).document(partnerId).updateData({
  //     "cart": FieldValue.arrayUnion([cartItem])
  //   });
  // }

  // void removeFromCart({String partnerId, Map cartItem}){
  //   print("THE USER ID IS: $partnerId");
  //   print("cart items are: ${cartItem.toString()}");
  //   _firestore.collection(collection).document(partnerId).updateData({
  //     "cart": FieldValue.arrayRemove([cartItem])
  //   });
  // }

}