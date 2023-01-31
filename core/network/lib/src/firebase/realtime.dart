import 'package:firebase_database/firebase_database.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 31.01.2023.

class RealtimeMethods {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  /// Upload the file to the specified path
  /// NOTE: doc should be user id
  Future<void> upload({
    required String path,
    required String value,
  }) async {
    final DatabaseReference ref = database.ref();
    await ref.child(path).set(value);
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<List<dynamic>> getValues({
    required String path,
  }) async {
    final DatabaseReference ref = database.ref();
    final snap = await ref.child(path).get();
    return snap.children as List;
  }
}
