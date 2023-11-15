import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/destinations.dart';

@GenerateNiceMocks([MockSpec<Destinations>()])
void main() {
  final kMap = {'Kisumu': <String>[]};

  late Destinations destination;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance.collection('destination').doc('testDestinations').set(kMap);
    snapshot =
        await instance.collection('destination').doc('testDestinations').get();
  });

  setUp(() {
    destination = MockDestinations();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(destination.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = destination.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(destination.toFirestore()).called(1);
      verifyNoMoreInteractions(destination);
    });

    test('should return [Destinations] with the right data', () {
      //Arrange

      //Act
      final actual = Destinations.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<Destinations>());
    });
  });
}
