import 'package:cloud_firestore/cloud_firestore.dart';


class DbHelper {
  static const String collectionAdmin = 'Admins';


  static final FirebaseFirestore _db = FirebaseFirestore.instance;


  static Future<bool> isAdmin(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

}