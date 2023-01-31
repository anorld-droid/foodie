import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.01.2023.
class SendMessageUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Append the file to the specified path
  /// NOTE: doc should be user id
  Future<void> invoke({
    required MessageBird messageBird,
  }) async {
    await _cloudNetWorkDataSource.appendDoc<MessageBird>(
        collectionName: Constants.trice,
        docPath: Constants.messagebird,
        collectionPath: Constants.messages,
        file: messageBird,
        fromFirestore: MessageBird.fromFirestore,
        toFirestore: (MessageBird messageBird, _) => messageBird.toFirestore());
  }
}
