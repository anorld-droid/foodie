import 'package:model/model.dart';
import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.

class CloudNetWorkDataSource {
  final CloudMethods _cloudMethods = CloudMethods();

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> uploadUserModel(String collection, String doc, User user) async {
    final file = user.toJson();
    await _cloudMethods.upload(collection, doc, file);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<User> getUserModel(
    String collection,
    String doc,
  ) async {
    final snap = await _cloudMethods.get(collection, doc);
    return User.fromSnap(snap);
  }
}
