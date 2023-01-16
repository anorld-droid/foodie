import 'package:cloud_firestore/cloud_firestore.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class CloudMethods {
  final FirebaseFirestore mFirestore = FirebaseFirestore.instance;

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> upload(
      String collection, String doc, Map<String, dynamic> file) async {
    await mFirestore.collection(collection).doc(doc).set(file);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<DocumentSnapshot<Map<String, dynamic>>> get(
    String collection,
    String doc,
  ) async {
    return mFirestore.collection(collection).doc(doc).get();
  }
}
