import 'dart:typed_data';

import 'package:data_source/data_source.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ImageUseCase {
  final StorageNetworkDataSource _storageNetworkDataSource = Get.find();

  ///Returns the downloadUrl of the image
  Future<String> saveProfilePic(Uint8List file, String uid) async {
    return await _storageNetworkDataSource.uploadImageToStorage(
        Constants.profilePicUrl, file, uid);
  }
}
