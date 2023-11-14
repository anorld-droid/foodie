import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/cart_item.dart';
import 'package:model/src/constants.dart';

import 'cart_item_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CartItem>()])
void main() {
  //Set Up
  late CartItem item;

  setUp(() {
    item = MockCartItem();
  });

  const kJSON = {'key': 'value'};

  group('dataTransformation', () {
    test(
        'should call [toFirestore] once and return a json with the right data [kJSON]',
        () async {
      //Arrange
      when(item.toFirestore()).thenAnswer((_) => kJSON);

      //Act
      final actual = item.toFirestore();

      //Assert
      expect(actual, equals(kJSON));
      verify(item.toFirestore()).called(1);
      verifyNoMoreInteractions(item);
    });

    test(
        'should call [fromFirestore] once and return a CartItem with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kCartItemFromFirestore = CartItem.fromFirestore(
        null,
        {
          Constants.id: 'id',
          Constants.name: 'name',
          Constants.photoUrl: 'photoUrl',
          Constants.store: 'store',
          Constants.stockTag: 5,
          Constants.basicPrice: 23.89,
          Constants.sellingPrice: 56.0,
          Constants.quantity: 4,
          Constants.limit: 2,
        },
        null,
      );

      //Act
      final actual = CartItem.fromFirestore(
        null,
        {
          Constants.id: 'id',
          Constants.name: 'name',
          Constants.photoUrl: 'photoUrl',
          Constants.store: 'store',
          Constants.stockTag: 5,
          Constants.basicPrice: 23.89,
          Constants.sellingPrice: 56.0,
          Constants.quantity: 4,
          Constants.limit: 2,
        },
        null,
      );

      //Assert
      expect(actual.name, equals(kCartItemFromFirestore.name));
    });

    test('should call [fromJson] and return a CartItem with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kCartItemFromJson = CartItem.fromJson(
        {
          Constants.id: 'id',
          Constants.name: 'name',
          Constants.photoUrl: 'photoUrl',
          Constants.store: 'store',
          Constants.stockTag: 5,
          Constants.basicPrice: 23.89,
          Constants.sellingPrice: 56.0,
          Constants.quantity: 4,
          Constants.limit: 2,
        },
      );

      //Act
      final actual = CartItem.fromJson(
        {
          Constants.id: 'id',
          Constants.name: 'name',
          Constants.photoUrl: 'photoUrl',
          Constants.store: 'store',
          Constants.stockTag: 5,
          Constants.basicPrice: 23.89,
          Constants.sellingPrice: 56.0,
          Constants.quantity: 4,
          Constants.limit: 2,
        },
      );

      //Assert
      expect(actual.name, equals(kCartItemFromJson.name));
    });
  });
}
