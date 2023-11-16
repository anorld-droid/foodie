import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/src/custom/search.dart';

import 'search_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Search>()])
void main() {
  late Search search;
  //Search
  setUp(() {
    search = MockSearch();
  });

  test('should return a [JSON] List with search results', () async {
    //Arrange
    when(search.invoke('Apples')).thenAnswer(
      (_) async => [
        {'name': 'Red Apple'}
      ],
    );

    //Act
    final actual = await search.invoke('Apples');

    //Assert
    expect(
      actual,
      equals([
        {'name': 'Red Apple'}
      ]),
    );

    verify(search.invoke('Apples')).called(1);
    verifyNoMoreInteractions(search);
  });
}
