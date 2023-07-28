import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 02.03.2023.
class MessagingNetworkDataSource {
  final Messaging _messaging = Messaging();
  Future<void> init(
      void Function(
              {String? title,
              String? body,
              String? dataTitle,
              String? dataBody})
          listen) async {
    _messaging.invoke(listen);
  }
}
