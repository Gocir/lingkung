// import 'package:cloud_firestore/cloud_firestore.dart';

// class Category {
//   static const ID = "id";
//   static const NAME = "name";
//   static const IMAGE = "image";

//   String _id;
//   String _name;
//   String _image;

//   //  getters
//   String get id => _id;
//   String get name => _name;
//   String get image => _image;

//   Category.fromSnapshot(DocumentSnapshot snapshot){
//     _id = snapshot.data[ID];
//     _name = snapshot.data[NAME];
//     _image = snapshot.data[IMAGE];
//   }
// }

import 'package:flutter/cupertino.dart';

class CategoryTrash{
  final String categoryId;
  final String categoryName;

  // name constructors

  CategoryTrash({@required this.categoryId, @required this.categoryName});
}