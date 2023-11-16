import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixture/constants.dart';
import 'package:network/src/firebase/cloud.dart';

import 'cloud_test.mocks.dart';

@GenerateMocks([CloudMethods])
void main() {
  //Set up
  Map<String, dynamic> convertor(DocumentSnapshot<Map<String, dynamic>> item,
          SnapshotOptions? options) =>
      kMap;
  Map<String, Object?> invertor(
          Map<String, dynamic> items, SetOptions? options) =>
      kMap;
  final instance = FakeFirebaseFirestore();

  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  late QuerySnapshot<Map<String, dynamic>> querySnapshot;

  late CloudMethods mock;

  setUpAll(() async {
    await instance.collection('cart').doc('testCartItem').set(kMap);
    snapshot = await instance.collection('cart').doc('testCartItem').get();
    querySnapshot = await instance.collection('cart').get();
  });

  setUp(() {
    mock = MockCloudMethods();
  });

  test('shoud return [R -> Map<String, dynamic>] when successful', () async {
    //Arrange
    when(mock.getDoc<Map<String, dynamic>>(
            collection: 'collection',
            doc: 'doc',
            fromFirestore: convertor,
            toFirestore: invertor))
        .thenAnswer(
      (_) async => snapshot,
    );

    //Act
    final actual = await mock.getDoc<Map<String, dynamic>>(
        collection: 'collection',
        doc: 'doc',
        fromFirestore: convertor,
        toFirestore: invertor);

    //Assert
    expect(actual, equals(snapshot));

    verify(mock.getDoc<Map<String, dynamic>>(
            collection: 'collection',
            doc: 'doc',
            fromFirestore: convertor,
            toFirestore: invertor))
        .called(1);

    verifyNoMoreInteractions(mock);
  });

  test(
      'shoud return DocumentSnapshot R [where R -> Map<String, dynamic>] Stream when successful',
      () async {
    //Arrange
    when(mock.getDocStream<Map<String, dynamic>>(
            collection: 'collection',
            doc: 'doc',
            fromFirestore: convertor,
            toFirestore: invertor))
        .thenAnswer(
      (_) async => Stream.value(snapshot),
    );

    //Act
    final actual = await mock
        .getDocStream<Map<String, dynamic>>(
            collection: 'collection',
            doc: 'doc',
            fromFirestore: convertor,
            toFirestore: invertor)
        .then((value) => value.first)
        .then((value) => value.data());

    //Assert
    expect(actual, equals(kMap));

    verify(mock.getDocStream<Map<String, dynamic>>(
            collection: 'collection',
            doc: 'doc',
            fromFirestore: convertor,
            toFirestore: invertor))
        .called(1);

    verifyNoMoreInteractions(mock);
  });

  test(
      'shoud return DocumentSnapshot R [where R -> Map<String, dynamic>] Stream from multiple collections when successful',
      () async {
    //Arrange
    when(mock.getDocFromMultiCollection(
      parentCol: 'parentCol',
      parentDoc: 'parentDoc',
      childCol: 'childCol',
      childDoc: 'childDoc',
      fromFirestore: convertor,
      toFirestore: invertor,
    )).thenAnswer(
      (_) async => Stream.value(snapshot),
    );

    //Act
    final actual = await mock
        .getDocFromMultiCollection(
            parentCol: 'parentCol',
            parentDoc: 'parentDoc',
            childCol: 'childCol',
            childDoc: 'childDoc',
            fromFirestore: convertor,
            toFirestore: invertor)
        .then((value) => value.first)
        .then((value) => value.data());

    //Assert
    expect(actual, equals(kMap));

    verify(mock.getDocFromMultiCollection(
            parentCol: 'parentCol',
            parentDoc: 'parentDoc',
            childCol: 'childCol',
            childDoc: 'childDoc',
            fromFirestore: convertor,
            toFirestore: invertor))
        .called(1);

    verifyNoMoreInteractions(mock);
  });

  test(
      'shoud return QuerySnapshot  R [where R -> Map<String, dynamic>] Stream when successful',
      () async {
    //Arrange
    when(mock.getCollectionStream<Map<String, dynamic>>(
            collection: 'collection'))
        .thenAnswer(
      (_) async => Stream.value(querySnapshot),
    );

    //Act
    final actual = await mock
        .getCollectionStream<Map<String, dynamic>>(collection: 'collection')
        .then((value) => value.first)
        .then((value) => value.docs.first.data());

    //Assert
    expect(actual, equals(kMap));

    verify(mock.getCollectionStream<Map<String, dynamic>>(
            collection: 'collection'))
        .called(1);

    verifyNoMoreInteractions(mock);
  });

  test(
      'shoud return QuerySnapshot  R [where R -> Map<String, dynamic>] Stream when successful [getDocs]',
      () async {
    //Arrange
    when(mock.getDocs(
            collectionName: 'collectionName',
            docPath: 'docPath',
            collectionPath: 'collectionPath',
            fromFirestore: convertor,
            toFirestore: invertor))
        .thenAnswer(
      (_) => Stream.value(querySnapshot),
    );

    //Act
    final actual = await mock
        .getDocs(
            collectionName: 'collectionName',
            docPath: 'docPath',
            collectionPath: 'collectionPath',
            fromFirestore: convertor,
            toFirestore: invertor)
        .first
        .then(
          (value) => value.docs.first.data(),
        );

    //Assert
    expect(actual, equals(kMap));

    verify(mock.getDocs(
            collectionName: 'collectionName',
            docPath: 'docPath',
            collectionPath: 'collectionPath',
            fromFirestore: convertor,
            toFirestore: invertor))
        .called(1);

    verifyNoMoreInteractions(mock);
  });

  test(
      'shoud return QuerySnapshot  R [where R -> Map<String, dynamic>] Stream when successful [filterDocs]',
      () async {
    //Arrange
    when(mock.filterDocs(
      collection: 'collection',
      filterValue: 'filterValue',
      fromFirestore: convertor,
      toFirestore: invertor,
    )).thenAnswer(
      (_) async => querySnapshot,
    );

    //Act
    final actual = await mock
        .filterDocs(
          collection: 'collection',
          filterValue: 'filterValue',
          fromFirestore: convertor,
          toFirestore: invertor,
        )
        .then(
          (value) => value.docs.first.data(),
        );

    //Assert
    expect(actual, equals(kMap));

    verify(mock.filterDocs(
      collection: 'collection',
      filterValue: 'filterValue',
      fromFirestore: convertor,
      toFirestore: invertor,
    )).called(1);

    verifyNoMoreInteractions(mock);
  });
}
