// Mocks generated by Mockito 5.4.2 from annotations
// in model/test/src/cuisine_item_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get/get.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:model/model.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRx_0<T> extends _i1.SmartFake implements _i2.Rx<T> {
  _FakeRx_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCartItem_1 extends _i1.SmartFake implements _i3.CartItem {
  _FakeCartItem_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CuisineItem].
///
/// See the documentation for Mockito's code generation for more information.
class MockCuisineItem extends _i1.Mock implements _i3.CuisineItem {
  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  Map<String, int> get stockTag => (super.noSuchMethod(
        Invocation.getter(#stockTag),
        returnValue: <String, int>{},
        returnValueForMissingStub: <String, int>{},
      ) as Map<String, int>);

  @override
  String get store => (super.noSuchMethod(
        Invocation.getter(#store),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  Map<String, double> get basicPrice => (super.noSuchMethod(
        Invocation.getter(#basicPrice),
        returnValue: <String, double>{},
        returnValueForMissingStub: <String, double>{},
      ) as Map<String, double>);

  @override
  _i2.Rx<Map<String, double>> get sellingPrice => (super.noSuchMethod(
        Invocation.getter(#sellingPrice),
        returnValue: _FakeRx_0<Map<String, double>>(
          this,
          Invocation.getter(#sellingPrice),
        ),
        returnValueForMissingStub: _FakeRx_0<Map<String, double>>(
          this,
          Invocation.getter(#sellingPrice),
        ),
      ) as _i2.Rx<Map<String, double>>);

  @override
  _i2.Rx<int> get quantity => (super.noSuchMethod(
        Invocation.getter(#quantity),
        returnValue: _FakeRx_0<int>(
          this,
          Invocation.getter(#quantity),
        ),
        returnValueForMissingStub: _FakeRx_0<int>(
          this,
          Invocation.getter(#quantity),
        ),
      ) as _i2.Rx<int>);

  @override
  String get detail => (super.noSuchMethod(
        Invocation.getter(#detail),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get photoUrl => (super.noSuchMethod(
        Invocation.getter(#photoUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  Map<String, List<String>> get favorites => (super.noSuchMethod(
        Invocation.getter(#favorites),
        returnValue: <String, List<String>>{},
        returnValueForMissingStub: <String, List<String>>{},
      ) as Map<String, List<String>>);

  @override
  int get limit => (super.noSuchMethod(
        Invocation.getter(#limit),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  _i3.CartItem asCartItem(String? selectedStore) => (super.noSuchMethod(
        Invocation.method(
          #asCartItem,
          [selectedStore],
        ),
        returnValue: _FakeCartItem_1(
          this,
          Invocation.method(
            #asCartItem,
            [selectedStore],
          ),
        ),
        returnValueForMissingStub: _FakeCartItem_1(
          this,
          Invocation.method(
            #asCartItem,
            [selectedStore],
          ),
        ),
      ) as _i3.CartItem);

  @override
  Map<String, dynamic> toFirestore() => (super.noSuchMethod(
        Invocation.method(
          #toFirestore,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}