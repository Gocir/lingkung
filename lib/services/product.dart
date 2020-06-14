import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  Firestore _productCollection = Firestore.instance;
  String ref = 'products';

  void addProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
    _productCollection.collection(ref).document(productId).setData(data);
  }
}

// class ProductService {
//   static CollectionReference productCollection = Firestore.instance.collection("products");

//   static Future<void> createOrUpdateProduct(String id, {String name, int stock, double price}) async {
//     await productCollection.document(id).setData({
//       'name': name,
//       'stok': stock,
//       'harga': price
//     });
//   }

//   static Future<DocumentSnapshot> getProduct(String id) async {
//     return await productCollection.document(id).get();
//   }
// }