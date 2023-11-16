import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/src/custom/stk_push.dart';

import 'stk_push_test.mocks.dart';

@GenerateMocks([STKPush])
void main() {
  late STKPush pay;

  setUp(() {
    pay = MockSTKPush();
  });

  test('should return [AccessCredentials] when [getAccessCode] succeeds',
      () async {
    //Arrange
    final accessCredentials =
        AccessCredentials(accessToken: 'accessToken', expiresIn: 'expiresIn');
    when(pay.getAccessCode())
        .thenAnswer((realInvocation) async => accessCredentials);

    //Act
    final actual = await pay.getAccessCode();

    //Assert
    expect(actual, isA<AccessCredentials>());
    expect(actual?.accessToken, equals(accessCredentials.accessToken));

    verify(pay.getAccessCode()).called(1);
    verifyNoMoreInteractions(pay);
  });

  test('should return [null] when [getAccessCode] fails', () async {
    //Arrange
    when(pay.getAccessCode()).thenAnswer((_) async => null);

    //Act
    final actual = await pay.getAccessCode();

    //Assert
    expect(actual, equals(null));

    verify(pay.getAccessCode()).called(1);
    verifyNoMoreInteractions(pay);
  });

  test('should return [CheckoutRequestID] string on success', () async {
    //Arrange
    when(pay.invoke('1200', '+254757913481', 'Apple'))
        .thenAnswer((_) async => 'CheckoutRequestID');

    //Act
    final actual = await pay.invoke('1200', '+254757913481', 'Apple');

    //Assert
    expect(actual, isA<String>());
    expect(actual, equals('CheckoutRequestID'));

    verify(pay.invoke('1200', '+254757913481', 'Apple')).called(1);
    verifyNoMoreInteractions(pay);
  });

  test('should return [null]  on fail', () async {
    //Arrange
    when(pay.invoke('1200', '+254757913481', 'Apple'))
        .thenAnswer((_) async => null);

    //Act
    final actual = await pay.invoke('1200', '+254757913481', 'Apple');

    //Assert
    expect(actual, equals(null));

    verify(pay.invoke('1200', '+254757913481', 'Apple')).called(1);
    verifyNoMoreInteractions(pay);
  });
}
