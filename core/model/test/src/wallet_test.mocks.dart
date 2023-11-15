// Mocks generated by Mockito 5.4.2 from annotations
// in model/test/src/wallet_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:model/src/wallet.dart' as _i2;

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

class _FakeDateTime_0 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Wallet].
///
/// See the documentation for Mockito's code generation for more information.
class MockWallet extends _i1.Mock implements _i2.Wallet {
  @override
  double get balance => (super.noSuchMethod(
        Invocation.getter(#balance),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  double get borrowed => (super.noSuchMethod(
        Invocation.getter(#borrowed),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  double get creditLimit => (super.noSuchMethod(
        Invocation.getter(#creditLimit),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  DateTime get validThru => (super.noSuchMethod(
        Invocation.getter(#validThru),
        returnValue: _FakeDateTime_0(
          this,
          Invocation.getter(#validThru),
        ),
        returnValueForMissingStub: _FakeDateTime_0(
          this,
          Invocation.getter(#validThru),
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
