// import 'package:cloud_firestore/cloud_firestore.dart';

// class Trash {
//   static const ID = "id";
//   static const NAME = "name";
//   static const IMAGE = "image";
//   static const DESCRIPTION = "description";
//   static const CATEGORY = "category";

//   String _id;
//   String _name;
//   String _image;
//   String _description;
//   List<String> _category;

//   //  getters
//   String get id => _id;
//   String get name => _name;
//   String get image => _image;
//   String get description => _description;
//   List<String> get category => _category;

//   Trash.fromSnapshot(DocumentSnapshot snapshot){
//     _id = snapshot.data[ID];
//     _name = snapshot.data[NAME];
//     _image = snapshot.data[IMAGE];
//     _description = snapshot.data[DESCRIPTION];
//   }
// }

import 'package:flutter/cupertino.dart';

class Trash{
  final String id;
  final String category;
  final String name;
  final String image;
  final String materialType;
  final String section;
  final String description;

  Trash({
    @required this.id,
    @required this.category,
    @required this.name,
    @required this.image,
    @required this.materialType,
    @required this.section,
    @required this.description,
  });
}