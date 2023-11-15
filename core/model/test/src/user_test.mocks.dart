// Mocks generated by Mockito 5.4.2 from annotations
// in model/test/src/user_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:model/src/user.dart' as _i2;

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

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i2.User {
  @override
  String get uid => (super.noSuchMethod(
        Invocation.getter(#uid),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get username => (super.noSuchMethod(
        Invocation.getter(#username),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get account => (super.noSuchMethod(
        Invocation.getter(#account),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get favoriteStore => (super.noSuchMethod(
        Invocation.getter(#favoriteStore),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

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
