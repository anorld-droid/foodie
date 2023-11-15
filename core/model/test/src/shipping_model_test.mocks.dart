// Mocks generated by Mockito 5.4.2 from annotations
// in model/test/src/shipping_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:model/model.dart' as _i2;

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

class _FakeShippingInfo_0 extends _i1.SmartFake implements _i2.ShippingInfo {
  _FakeShippingInfo_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_1 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ShippingModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockShippingModel extends _i1.Mock implements _i2.ShippingModel {
  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ShippingInfo get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeShippingInfo_0(
          this,
          Invocation.getter(#user),
        ),
        returnValueForMissingStub: _FakeShippingInfo_0(
          this,
          Invocation.getter(#user),
        ),
      ) as _i2.ShippingInfo);

  @override
  String get order => (super.noSuchMethod(
        Invocation.getter(#order),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  List<_i2.CartItem> get items => (super.noSuchMethod(
        Invocation.getter(#items),
        returnValue: <_i2.CartItem>[],
        returnValueForMissingStub: <_i2.CartItem>[],
      ) as List<_i2.CartItem>);

  @override
  String get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  DateTime get timeStamp => (super.noSuchMethod(
        Invocation.getter(#timeStamp),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#timeStamp),
        ),
        returnValueForMissingStub: _FakeDateTime_1(
          this,
          Invocation.getter(#timeStamp),
        ),
      ) as DateTime);

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
