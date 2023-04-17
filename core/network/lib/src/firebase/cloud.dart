import 'package:cloud_firestore/cloud_firestore.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class CloudMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CloudMethods() {
    _firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

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
    await _firestore
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
    await _firestore
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
    return _firestore
        .collection(collection)
        .doc(doc)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .get();
  }

  Future<Stream<DocumentSnapshot<R>>> getDocStream<R>(
      {required String collection,
      required String doc,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return _firestore
        .collection(collection)
        .doc(doc)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .snapshots();
  }

  Future<Stream<DocumentSnapshot<R>>> getDocFromMultiCollection<R>(
      {required String parentCol,
      required String parentDoc,
      required String childCol,
      required String childDoc,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return _firestore
        .collection(parentCol)
        .doc(parentDoc)
        .collection(childCol)
        .doc(childDoc)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .snapshots();
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getCollectionStream<R>({
    required String collection,
  }) async {
    return _firestore.collection(collection).snapshots();
  }

  /// Get the files from the specified path
  /// NOTE: docPath should be user id
  Stream<QuerySnapshot<R>> getDocs<R>(
      {required String collectionName,
      required String docPath,
      required String collectionPath,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?) toFirestore}) {
    return _firestore
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
    await _firestore.collection(collection).doc(doc).update(data);
  }

  /// update the file to the specified path
  /// NOTE: docPath should be user id
  Future<void> updateFieldFromMultiCollection<R>({
    required String parentCol,
    required String parentDoc,
    required String childCol,
    required String childDoc,
    required Map<String, Object?> data,
  }) async {
    await _firestore
        .collection(parentCol)
        .doc(parentDoc)
        .collection(childCol)
        .doc(childDoc)
        .update(data);
  }

  /// delete the file from the specified path
  /// NOTE: docPath should be user id
  Future<void> deleteDocFromMulitiCollection<R>({
    required String collectionName,
    required String docPath,
    required String collectionPath,
    required String docId,
  }) async {
    await _firestore
        .collection(collectionName)
        .doc(docPath)
        .collection(collectionPath)
        .doc(docId)
        .delete();
  }

  Future<QuerySnapshot<R>> filterDocs<R>(
      {required String collection,
      required String filterValue,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return await _firestore
        .collection(collection)
        .where(filterValue, isEqualTo: true)
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .get();
  }
}
