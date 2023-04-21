import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.01.2023.
class SendMessageUseCase {
  final MessagingNetworkDataSource _messagingNetworkDataSource =
      MessagingNetworkDataSource();

  /// Append the file to the specified path
  /// NOTE: doc should be user id
  Future<void> invoke({
    required MessageBird messageBird,
  }) async {
    final CloudNetWorkDataSource cloudNetWorkDataSource = Get.find();
    await cloudNetWorkDataSource.appendDoc<MessageBird>(
        collectionName: Constants.trice,
        docPath: Constants.messagebird,
        collectionPath: Constants.messages,
        file: messageBird,
        fromFirestore: MessageBird.fromFirestore,
        toFirestore: (MessageBird messageBird, _) => messageBird.toFirestore());
  }

  Future<void> pushNotification(
      void Function(
              {String? title,
              String? body,
              String? dataTitle,
              String? dataBody})
          listen) async {
    _messagingNetworkDataSource.init(listen);
  }
}
