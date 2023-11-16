// Mocks generated by Mockito 5.4.2 from annotations
// in network/test/src/firebase/fcloud_functions_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cloud_functions/cloud_functions.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:network/src/firebase/fcloud_functions.dart' as _i3;

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

class _FakeFirebaseFunctions_0 extends _i1.SmartFake
    implements _i2.FirebaseFunctions {
  _FakeFirebaseFunctions_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FCloudFunctions].
///
/// See the documentation for Mockito's code generation for more information.
class MockFCloudFunctions extends _i1.Mock implements _i3.FCloudFunctions {
  MockFCloudFunctions() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseFunctions get functions => (super.noSuchMethod(
        Invocation.getter(#functions),
        returnValue: _FakeFirebaseFunctions_0(
          this,
          Invocation.getter(#functions),
        ),
      ) as _i2.FirebaseFunctions);

  @override
  set functions(_i2.FirebaseFunctions? _functions) => super.noSuchMethod(
        Invocation.setter(
          #functions,
          _functions,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<List<String>> get(String? docPath) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [docPath],
        ),
        returnValue: _i4.Future<List<String>>.value(<String>[]),
      ) as _i4.Future<List<String>>);
}
