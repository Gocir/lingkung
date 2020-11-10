import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/junkSalesModel.dart';
import 'package:lingkung/models/trashCartModel.dart';

class JunkSalesServices {
  String collection = "junkSales";
  String subCollection = "listTrash";
  Firestore _firestore = Firestore.instance;

  void createJunkSales({Map<String, dynamic> junkSales}) {
    _firestore.collection(collection).document(junkSales['id']).setData(junkSales);
  }

  void addlistTrash(
      {String junkSalesId, Map<String, dynamic> listTrash}) {
    _firestore
        .collection(collection)
        .document(junkSalesId)
        .collection(subCollection)
        .document(listTrash['id'])
        .setData(listTrash);
  }
  
  void updateJunkSales({Map<String, dynamic> data}) {
    _firestore.collection(collection).document(data['id']).setData(data);
  }

  void deleteJunkSales({String junkSalesId}) {
    _firestore
        .collection(collection)
        .document(junkSalesId)
        .delete();
  }
  
  Future<void> deleteListTrash({String junkSalesId, String trashItemId}) async {
    _firestore
        .collection(collection)
        .document(junkSalesId)
        .collection(subCollection)
        .document(trashItemId)
        .delete();
  }

  Future<List<JunkSalesModel>> getJunkSales() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<JunkSalesModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(JunkSalesModel.fromSnapshot(order));
        }
        return orders;
      });
  
  Future<JunkSalesModel> getJunkSalesById({String junkSalesId}) async =>
      _firestore.collection(collection).document(junkSalesId).get().then((result) {
         if (result.data == null) {
          return null;
        }
        return JunkSalesModel.fromSnapshot(result);
      });

  Future<List<JunkSalesModel>> getUserJunkSales({String id, String userId, String courierId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .where("status", whereIn: ["Start Orders", "Take Orders", "Receive Orders", "Deliver Orders"])
          .getDocuments()
          .then((result) {
        List<JunkSalesModel> userJunkSales = [];
        for (DocumentSnapshot junkSales in result.documents) {
          userJunkSales.add(JunkSalesModel.fromSnapshot(junkSales));
        }
        return userJunkSales;
      });
  
  Future<List<JunkSalesModel>> getUserJunkSalesComplete({String id, String userId, String status, String courierId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .where("status", isEqualTo: status)
          .getDocuments()
          .then((result) {
        List<JunkSalesModel> userJunkSales = [];
        for (DocumentSnapshot junkSales in result.documents) {
          userJunkSales.add(JunkSalesModel.fromSnapshot(junkSales));
        }
        return userJunkSales;
      });

  Future<List<JunkSalesModel>> getUserJunkSalesByStatus(
          {String userId, String status}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .where("status", isEqualTo: status)
          .getDocuments()
          .then((result) {
        List<JunkSalesModel> orderByStatus = [];
        for (DocumentSnapshot order in result.documents) {
          orderByStatus.add(JunkSalesModel.fromSnapshot(order));
        }
        return orderByStatus;
      });
  
  Future<List<TrashCartModel>> getListTrashById({String junkSalesId}) async =>
      _firestore
          .collection(collection)
          .document(junkSalesId)
          .collection(subCollection)
          .where('junkSalesId', isEqualTo: junkSalesId)
          .getDocuments()
          .then((result) {
        List<TrashCartModel> listTrashById = [];
        for (DocumentSnapshot trashItem in result.documents) {
          listTrashById.add(TrashCartModel.fromSnapshot(trashItem));
        }
        return listTrashById;
      });
}
