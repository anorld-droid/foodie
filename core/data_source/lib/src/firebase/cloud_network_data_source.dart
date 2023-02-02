import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class CloudNetWorkDataSource {
  final CloudMethods _cloudMethods = CloudMethods();

  /// Upload the file to the specified path or replace the existing one
  /// NOTE: doc should be user id
  Future<void> uploadOrReplaceDoc<R>(
      {required String collection,
      required String doc,
      required R file,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    await _cloudMethods.setDoc(
        collection: collection,
        doc: doc,
        file: file,
        fromFirestore: fromFirestore,
        toFirestore: toFirestore);
  }

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> appendDoc<R>(
      {required String collectionName,
      required String docPath,
      required String collectionPath,
      required R file,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    await _cloudMethods.addDoc(
        collectionName: collectionName,
        docPath: docPath,
        collectionPath: collectionPath,
        file: file,
        fromFirestore: fromFirestore,
        toFirestore: toFirestore);
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
    return await _cloudMethods.getDoc(
        collection: collection,
        doc: doc,
        fromFirestore: fromFirestore,
        toFirestore: toFirestore);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<Stream<DocumentSnapshot<R>>> getDocStream<R>(
      {required String collection,
      required String doc,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return await _cloudMethods.getDocStream(
        collection: collection,
        doc: doc,
        fromFirestore: fromFirestore,
        toFirestore: toFirestore);
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getCollectionStream<R>({
    required String collection,
  }) async {
    return _cloudMethods.getCollectionStream(
      collection: collection,
    );
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<Stream<QuerySnapshot<R>>> getDocs<R>(
      {required String collectionName,
      required String docPath,
      required String collectionPath,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return await _cloudMethods.getDocs(
        collectionName: collectionName,
        docPath: docPath,
        collectionPath: collectionPath,
        fromFirestore: fromFirestore,
        toFirestore: toFirestore);
  }

  /// update the file to the specified path
  /// NOTE: docPath should be user id
  Future<void> updateField<R>({
    required String collection,
    required String doc,
    required Map<String, Object?> data,
  }) async {
    await _cloudMethods.updateField<R>(
      collection: collection,
      doc: doc,
      data: data,
    );
  }

  /// delete the file from the specified path
  /// NOTE: docPath should be user id
  Future<void> deleteDocFromMulitiCollection<R>({
    required String collectionName,
    required String docPath,
    required String collectionPath,
    required String docId,
  }) async {
    await _cloudMethods.deleteDocFromMulitiCollection<R>(
        collectionName: collectionName,
        docPath: docPath,
        collectionPath: collectionPath,
        docId: docId);
  }

  /// get docs with specific values
  Future<QuerySnapshot<R>> filterDocs<R>(
      {required String collection,
      required String filterValue,
      required R Function(
              DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
          fromFirestore,
      required Map<String, Object?> Function(R, SetOptions?)
          toFirestore}) async {
    return await _cloudMethods.filterDocs(
        collection: collection,
        filterValue: filterValue,
        fromFirestore: fromFirestore,
        toFirestore: toFirestore);
  }
}
