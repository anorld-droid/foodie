import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 31.01.2023.
class RealtimeNetworkDataSource {
  final RealtimeMethods _realtimeMethods = RealtimeMethods();

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> save({
    required String path,
    required String value,
  }) async {
    await _realtimeMethods.upload(path: path, value: value);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<List<dynamic>> values({
    required String path,
  }) async {
    return await _realtimeMethods.getValues(path: path);
  }
}
