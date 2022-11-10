// Mocks generated by Mockito 5.3.0 from annotations
// in smart_menu_app/test/layers/domain/usecases/user/get_current_user_usecase/get_current_user_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smart_menu_app/core/error/failure.dart' as _i5;
import 'package:smart_menu_app/layers/data/models/user/user_model.dart' as _i6;
import 'package:smart_menu_app/layers/domain/repositories/user/auth/auth_repostitory.dart'
    as _i3;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserModel?>> getCurrentUser() =>
      (super.noSuchMethod(Invocation.method(#getCurrentUser, []),
              returnValue:
                  _i4.Future<_i2.Either<_i5.Failure, _i6.UserModel?>>.value(
                      _FakeEither_0<_i5.Failure, _i6.UserModel?>(
                          this, Invocation.method(#getCurrentUser, []))))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.UserModel?>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserModel?>> signIn() =>
      (super.noSuchMethod(Invocation.method(#signIn, []),
              returnValue:
                  _i4.Future<_i2.Either<_i5.Failure, _i6.UserModel?>>.value(
                      _FakeEither_0<_i5.Failure, _i6.UserModel?>(
                          this, Invocation.method(#signIn, []))))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.UserModel?>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>(
                      this, Invocation.method(#signOut, []))))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
