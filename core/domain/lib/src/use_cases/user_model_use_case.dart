import 'package:data_source/data_source.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class UserModelUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource =
      CloudNetWorkDataSource();

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> uploadUserModel(String collection, String doc, User user) async {
    await _cloudNetWorkDataSource.uploadUserModel(collection, doc, user);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<User> getUserModel(String collection, String doc) async {
    return _cloudNetWorkDataSource.getUserModel(collection, doc);
  }
}
