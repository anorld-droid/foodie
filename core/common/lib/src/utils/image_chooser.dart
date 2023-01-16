import 'dart:async';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 14.01.2023.
Future<Uint8List?> pickImageFromGallery() async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  return await file!.readAsBytes();
}
