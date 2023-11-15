import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

import 'cuisine_item_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CuisineItem>()])
void main() {
  //Set Up
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  late CuisineItem item;

  final kMap = {
    Constants.id: 'id',
    Constants.name: 'name',
    Constants.photoUrl: 'photoUrl',
    Constants.store: 'store',
    Constants.stockTag: <String, int>{},
    Constants.basicPrice: <String, double>{},
    Constants.sellingPrice: <String, double>{},
    Constants.quantity: 4,
    Constants.limit: 2,
    Constants.detail: 'detail',
    Constants.favorites: <String, List<String>>{},
  };

  setUpAll(() async {
    await instance.collection('cuisine').doc('testCuisineItem').set(kMap);
    snapshot =
        await instance.collection('cuisine').doc('testCuisineItem').get();
  });

  setUp(() {
    item = MockCuisineItem();
  });

  group('dataTransformation', () {
    test(
        'should return CartItem, when [asCartItem is called] with the right data',
        () {
      //Arrange
      final mCartItem = item.asCartItem('foodie');
      when(item.asCartItem('foodie')).thenAnswer((_) => mCartItem);

      //Act
      final actual = item.asCartItem('foodie');

      //Assert
      expect(actual, isA<CartItem>());
      verify(item.asCartItem('foodie')).called(2);
      verifyNoMoreInteractions(item);
    });
    test(
        'should call [toFirestore] once and return a json with the right data [kJSON]',
        () async {
      //Arrange
      when(item.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = item.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(item.toFirestore()).called(1);
      verifyNoMoreInteractions(item);
    });

    test(
        'should call [fromFirestore] once and return a CuisineItem with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kCuisineItemFromFirestore = CuisineItem.fromFirestore(
        snapshot,
        null,
      );

      //Act
      final actual = CuisineItem.fromFirestore(
        snapshot,
        null,
      );

      //Assert
      expect(actual.name, equals(kCuisineItemFromFirestore.name));
    });

    test('should call [fromJson] and return a CuisineItem with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kCuisineItemFromJson = CuisineItem.fromJson(kMap);

      //Act
      final actual = CuisineItem.fromJson(kMap);

      //Assert
      expect(actual.name, equals(kCuisineItemFromJson.name));
    });
  });
}
