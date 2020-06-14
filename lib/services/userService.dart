// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lingkung/models/user.dart';

// class UserService{

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   //create user obj based on FirebaseUser
//   User _userFromFirebaseUser(FirebaseUser user){
//     return user != null ? User(uid: user.uid, name: user.displayName, email: user.email) : null;
//   }

//   //auth change user stream
//   Stream<User> get user{
//     return _auth.onAuthStateChanged
//     // .map((FirebaseUser user) => _userFromFirebaseUser(user));
//     .map(_userFromFirebaseUser);
//   }

//   //Login anon
//   // Future loginAnon() async{
//   //   try {
//   //     AuthResult result = await _auth.signInAnonymously();
//   //     FirebaseUser user = result.user;
//   //     return _userFromFirebaseUser(user);
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return null;
//   //   }
//   // }

//   //Login email & pass
//   Future loginWithEmailAndPassword({String email, String password}) async {
//     try {
//       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       FirebaseUser user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   //Register email & pass
//   Future registerWithEmailAndPassword({String name, String email, String password}) async {
//     try {
//       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       UserUpdateInfo info = UserUpdateInfo();
//       info.displayName = '$name';
//       await result.user.updateProfile(info);
//       FirebaseUser user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   //Logout
//   Future logout() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingkung/models/userModel.dart';

class UserServices{

  String collection = "users";
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).document(id).setData(values);
  }

  void updateUserData(Map<String, dynamic> values){
    _firestore.collection(collection).document(values['id']).updateData(values);
  }

  Future<UserModel> getUserById(String id) => _firestore.collection(collection).document(id.toString()).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });

  // Future<UserModel> getBusinessDataById(String id) => _firestore.collection(collection).document(id).get().then((doc){
  //   return UserModel.fromSnapshot(doc);
  // });

  // void addToCart({String userId, Map cartItem}){
  //   print("THE USER ID IS: $userId");
  //   print("cart items are: ${cartItem.toString()}");
  //   _firestore.collection(collection).document(userId).updateData({
  //     "cart": FieldValue.arrayUnion([cartItem])
  //   });
  // }

  // void removeFromCart({String userId, Map cartItem}){
  //   print("THE USER ID IS: $userId");
  //   print("cart items are: ${cartItem.toString()}");
  //   _firestore.collection(collection).document(userId).updateData({
  //     "cart": FieldValue.arrayRemove([cartItem])
  //   });
  // }

}