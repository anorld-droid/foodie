import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/src/firebase/fcloud_functions.dart';

import 'fcloud_functions_test.mocks.dart';

@GenerateMocks([FCloudFunctions])
void main() {
  late FCloudFunctions mock;

  setUp(() {
    mock = MockFCloudFunctions();
  });

  test('should return a [List<String>] if successful', () async {
    //Arrange
    when(mock.get('docPath')).thenAnswer(
      (realInvocation) async => ['paths_to_docs'],
    );

    //Act
    final actual = await mock.get('docPath');

    //Assert
    expect(actual, equals(['paths_to_docs']));

    verify(mock.get('docPath')).called(1);
    verifyNoMoreInteractions(mock);
  });
}
