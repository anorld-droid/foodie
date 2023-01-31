import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class UserModelUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();
  final SearchNetworkDataSource _searchNetworkDataSource =
      SearchNetworkDataSource();
  final RealtimeNetworkDataSource _realtimeNetworkDataSource =
      RealtimeNetworkDataSource();

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> upload(String doc, User user) async {
    await _cloudNetWorkDataSource.uploadOrReplaceDoc<User>(
        collection: Constants.users,
        doc: doc,
        file: user,
        fromFirestore: User.fromFirestore,
        toFirestore: (User user, _) => user.toFirestore());
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<User?> get(String doc) async {
    final snap = await _cloudNetWorkDataSource.getDoc<User>(
        collection: Constants.users,
        doc: doc,
        fromFirestore: User.fromFirestore,
        toFirestore: (User user, _) => user.toFirestore());
    ;
    return snap.data();
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<Stream<DocumentSnapshot<User>>> getShippingInfo(String doc) async {
    final snap = await _cloudNetWorkDataSource.getDocStream<User>(
        collection: Constants.users,
        doc: doc,
        fromFirestore: User.fromFirestore,
        toFirestore: (User user, _) => user.toFirestore());
    return snap;
  }

  /// update the file to the specified path
  /// NOTE: docPath should be user id
  Future<void> updateShippingInfo({
    required String userId,
    required ShippingInfo shippingInfo,
  }) async {
    await _cloudNetWorkDataSource.updateField<ShippingInfo>(
      collection: Constants.users,
      doc: userId,
      data: shippingInfo.toFirestore(),
    );
  }

  Future<void> savePhoneNumber(String query) async {
    return await _realtimeNetworkDataSource.save(
      path: 'users',
      value: query,
    );
  }

  Future<bool> exists(String query) async {
    final users = await _realtimeNetworkDataSource.values(path: 'users');
    return users.contains(query);
  }
}
