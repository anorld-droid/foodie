import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/messagebird_model.dart';

import 'messagebird_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MessageBird>()])
void main() {
  final kMap = {
    Constants.channelId: 'channelId',
    Constants.to: 'to',
    Constants.type: 'type',
    Constants.content: {Constants.text: 'text'},
  };

  late MessageBird messageBird;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance.collection('messageBird').doc('testMessageBird').set(kMap);
    snapshot =
        await instance.collection('messageBird').doc('testMessageBird').get();
  });

  setUp(() {
    messageBird = MockMessageBird();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(messageBird.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = messageBird.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(messageBird.toFirestore()).called(1);
      verifyNoMoreInteractions(messageBird);
    });

    test('should return [MessageBird] with the right data', () {
      //Arrange

      //Act
      final actual = MessageBird.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<MessageBird>());
    });
  });
}
