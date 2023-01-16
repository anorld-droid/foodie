import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 14.01.2023.
class User {
  final String uid;
  final String photoUrl;
  final String username;

  const User({
    required this.uid,
    required this.photoUrl,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
    Constants.uid: uid,
    Constants.username: username,
    Constants.photoUrl: photoUrl,
  };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        uid: snapshot[Constants.uid] as String,
        photoUrl: snapshot[Constants.photoUrl] as String,
        username: snapshot[Constants.username] as String,
        );
  }
}
