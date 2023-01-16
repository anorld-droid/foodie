import 'dart:typed_data';

import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class StorageNetworkDataSource {
  final StorageMethods _storageMethods = StorageMethods();

  Future<String> uploadImageToStorage(String childName, Uint8List file, String uid) async  {
    return await _storageMethods.uploadImageToStorage(childName, file, uid);
  }
}