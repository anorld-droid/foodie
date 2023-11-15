import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/restaurant.dart';

@GenerateNiceMocks([MockSpec<Restaurant>()])
void main() {
  final kMap = {
    Constants.name: 'name',
    Constants.locationName: 'locationName',
    Constants.locationCoordinate: 'locationCoordinate'
  };

  late Restaurant restaurant;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance.collection('restaurant').doc('testRestaurant').set(kMap);
    snapshot =
        await instance.collection('restaurant').doc('testRestaurant').get();
  });

  setUp(() {
    restaurant = MockRestaurant();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(restaurant.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = restaurant.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(restaurant.toFirestore()).called(1);
      verifyNoMoreInteractions(restaurant);
    });

    test('should return [Restaurant] with the right data', () {
      //Arrange

      //Act
      final actual = Restaurant.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<Restaurant>());
    });
  });
}
