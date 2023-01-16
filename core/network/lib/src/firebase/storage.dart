import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 14.01.2023.
class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  //uploading image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, String uid) async {
    Reference ref = _storage.ref().child(childName).child(uid);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
