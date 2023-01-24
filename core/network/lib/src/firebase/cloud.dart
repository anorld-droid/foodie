import 'package:cloud_firestore/cloud_firestore.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class CloudMethods {
  final FirebaseFirestore mFirestore = FirebaseFirestore.instance;

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> setDoc<R>(
      {required String collection,
      required String doc,
      required R file,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    await mFirestore
        .collection(collection)
        .doc(doc)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .set(file);
  }

  /// Add the file to the specified path, collection
  /// NOTE: docPath should be user id
  Future<void> addDoc<R>(
      {required String collectionName,
      required String docPath,
      required String collectionPath,
      required R file,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    await mFirestore
        .collection(collectionName)
        .doc(docPath)
        .collection(collectionPath)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .add(file);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<DocumentSnapshot<R>> getDoc<R>(
      {required String collection,
      required String doc,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return mFirestore
        .collection(collection)
        .doc(doc)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .get();
  }

  /// Get the files from the specified path
  /// NOTE: docPath should be user id
  Future<Stream<QuerySnapshot<R>>> getDocs<R>(
      {required String collectionName,
      required String docPath,
      required String collectionPath,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return mFirestore
        .collection(collectionName)
        .doc(docPath)
        .collection(collectionPath)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .snapshots();
  }

  /// update the file to the specified path
  /// NOTE: docPath should be user id
  Future<void> updateField<R>({
    required String collection,
    required String doc,
    required Map<String, Object?> data,
  }) async {
    await mFirestore.collection(collection).doc(doc).update(data);
  }
}
