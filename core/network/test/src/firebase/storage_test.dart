import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/network.dart';

import 'storage_test.mocks.dart';

@GenerateMocks([StorageMethods])
void main() {
  late StorageMethods mock;

  setUp(() {
    mock = MockStorageMethods();
  });

  test('should return a [String -> download url] on success', () async {
    //Arrange
    Uint8List file = Uint8List(43);
    when(mock.uploadImageToStorage('childName', file, 'uid')).thenAnswer(
      (realInvocation) async => 'downloadUrl',
    );

    //Act
    final actual = await mock.uploadImageToStorage('childName', file, 'uid');

    //Assert
    expect(actual, equals('downloadUrl'));

    verify(mock.uploadImageToStorage('childName', file, 'uid')).called(1);
    verifyNoMoreInteractions(mock);
  });
}
