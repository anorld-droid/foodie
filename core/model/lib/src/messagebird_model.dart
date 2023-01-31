import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class MessageBird {
  final String channelId;
  final String to;
  final String type;
  final String text;

  MessageBird(
      {this.channelId = Constants.channelIdValue,
      required this.to,
      this.type = Constants.text,
      required this.text});
  Map<String, dynamic> toFirestore() => {
        Constants.channelId: channelId,
        Constants.to: to,
        Constants.type: type,
        Constants.content: {Constants.text: text}
      };

  factory MessageBird.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return MessageBird(
        channelId: snapshot?[Constants.channelId] as String,
        to: snapshot?[Constants.to] as String,
        type: snapshot?[Constants.type] as String,
        text: snapshot?[Constants.content][Constants.text] as String);
  }
}
