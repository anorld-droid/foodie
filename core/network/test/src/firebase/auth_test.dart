import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/src/firebase/auth.dart';

import 'auth_test.mocks.dart';

@GenerateMocks([UserAuth])
void main() {
  late UserAuth mock;

  setUp(() {
    mock = MockUserAuth();
  });

  test('should return [Account created successfully] when account is created',
      () async {
    //Arrange
    when(mock.createAccount(emailAddress: 'emailAddress', password: 'password'))
        .thenAnswer((_) async => 'Account created successfully');

    //Asct
    final actual = await mock.createAccount(
        emailAddress: 'emailAddress', password: 'password');

    //Assert
    expect(actual, equals('Account created successfully'));

    verify(mock.createAccount(
            emailAddress: 'emailAddress', password: 'password'))
        .called(1);
    verifyNoMoreInteractions(mock);
  });

  test('should return [Successful authentication.] on successful sign in',
      () async {
    //Arrange
    when(mock.signInWithEmailPassword(
            emailAddress: 'emailAddress', password: 'password'))
        .thenAnswer((_) async => 'Successful authentication.');

    //Asct
    final actual = await mock.signInWithEmailPassword(
        emailAddress: 'emailAddress', password: 'password');

    //Assert
    expect(actual, equals('Successful authentication.'));

    verify(mock.signInWithEmailPassword(
            emailAddress: 'emailAddress', password: 'password'))
        .called(1);
    verifyNoMoreInteractions(mock);
  });

  group('isUserSignedIn', () {
    test('should return [true] if the user is signed in', () {
      //Arrange
      when(mock.isUserSignedIn()).thenAnswer((_) => true);

      //Act
      final actual = mock.isUserSignedIn();

      //Assert
      expect(actual, true);

      verify(mock.isUserSignedIn()).called(1);
      verifyNoMoreInteractions(mock);
    });

    test('should return [false] if the user is signed in', () {
      //Arrange
      when(mock.isUserSignedIn()).thenAnswer((_) => false);

      //Act
      final actual = mock.isUserSignedIn();

      //Assert
      expect(actual, false);

      verify(mock.isUserSignedIn()).called(1);
      verifyNoMoreInteractions(mock);
    });
  });

  group('getUserId', () {
    test('should return the user id if user is signed in', () {
      //Arrange
      when(mock.getUserId()).thenAnswer((_) => 'UserId');

      //Act
      final actual = mock.getUserId();

      //Assert
      expect(actual, equals('UserId'));

      verify(mock.getUserId()).called(1);
      verifyNoMoreInteractions(mock);
    });

    test('should return null if user is not signed in', () {
      //Arrange
      when(mock.getUserId()).thenAnswer((_) => null);

      //Act
      final actual = mock.getUserId();

      //Assert
      expect(actual, equals(null));

      verify(mock.getUserId()).called(1);
      verifyNoMoreInteractions(mock);
    });
  });

  group('getUserName', () {
    test('should return the user name if user is signed in', () {
      //Arrange
      when(mock.getUserName()).thenAnswer((_) => 'UserName');

      //Act
      final actual = mock.getUserName();

      //Assert
      expect(actual, equals('UserName'));

      verify(mock.getUserName()).called(1);
      verifyNoMoreInteractions(mock);
    });

    test('should return null if user is not signed in', () {
      //Arrange
      when(mock.getUserName()).thenAnswer((_) => null);

      //Act
      final actual = mock.getUserName();

      //Assert
      expect(actual, equals(null));

      verify(mock.getUserName()).called(1);
      verifyNoMoreInteractions(mock);
    });
  });

  group('getPhoneNumber', () {
    test('should return the [userPhoneNumber] if user is signed in', () {
      //Arrange
      when(mock.getPhoneNumber()).thenAnswer((_) => 'UserPhoneNumber');

      //Act
      final actual = mock.getPhoneNumber();

      //Assert
      expect(actual, equals('UserPhoneNumber'));

      verify(mock.getPhoneNumber()).called(1);
      verifyNoMoreInteractions(mock);
    });

    test('should return null if user is not signed in', () {
      //Arrange
      when(mock.getPhoneNumber()).thenAnswer((_) => null);

      //Act
      final actual = mock.getPhoneNumber();

      //Assert
      expect(actual, equals(null));

      verify(mock.getPhoneNumber()).called(1);
      verifyNoMoreInteractions(mock);
    });
  });

  group('getUserPhotoUrl', () {
    test('should return the [UserPhotoUrl] if user is signed in', () {
      //Arrange
      when(mock.getUserPhotoUrl()).thenAnswer((_) => 'UserPhotoUrl');

      //Act
      final actual = mock.getUserPhotoUrl();

      //Assert
      expect(actual, equals('UserPhotoUrl'));

      verify(mock.getUserPhotoUrl()).called(1);
      verifyNoMoreInteractions(mock);
    });

    test('should return null if user is not signed in', () {
      //Arrange
      when(mock.getUserPhotoUrl()).thenAnswer((_) => null);

      //Act
      final actual = mock.getUserPhotoUrl();

      //Assert
      expect(actual, equals(null));

      verify(mock.getUserPhotoUrl()).called(1);
      verifyNoMoreInteractions(mock);
    });
  });

  group('creationTime', () {
    test('should return the [CreationTime(DateTime)] if user is signed in', () {
      //Arrange
      final now = DateTime.now();
      when(mock.creationTime()).thenAnswer((_) => now);

      //Act
      final actual = mock.creationTime();

      //Assert
      expect(actual, equals(now));

      verify(mock.creationTime()).called(1);
      verifyNoMoreInteractions(mock);
    });

    test('should return null if user is not signed in', () {
      //Arrange
      when(mock.creationTime()).thenAnswer((_) => null);

      //Act
      final actual = mock.creationTime();

      //Assert
      expect(actual, equals(null));

      verify(mock.creationTime()).called(1);
      verifyNoMoreInteractions(mock);
    });
  });
}
