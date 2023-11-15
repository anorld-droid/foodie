import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

@GenerateNiceMocks([MockSpec<Subscription>()])
void main() {
  final kMap = {
    Constants.shippingInfo: 'shippingInfo',
    Constants.shippingStatus: true,
    Constants.minShipAmount: 23,
    Constants.executiveBenefits: <String, String>{},
    Constants.eliteBenefits: <String, String>{},
    Constants.executivePrice: 2311,
    Constants.elitePrice: 65,
    Constants.contact: 'contact',
  };

  late Subscription subscription;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance.collection('subscription').doc('testSubscription').set(kMap);
    snapshot =
        await instance.collection('subscription').doc('testSubscription').get();
  });

  setUp(() {
    subscription = MockSubscription();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(subscription.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = subscription.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(subscription.toFirestore()).called(1);
      verifyNoMoreInteractions(subscription);
    });

    test('should return [Subscription] with the right data', () {
      //Arrange

      //Act
      final actual = Subscription.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<Subscription>());
    });
  });
}
