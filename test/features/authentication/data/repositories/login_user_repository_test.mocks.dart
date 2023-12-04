// Mocks generated by Mockito 5.4.3 from annotations
// in veegil_bank/test/features/authentication/data/repositories/login_user_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart'
    as _i5;
import 'package:veegil_bank/features/authentication/data/data_sources/remote/login_user_data_source.dart'
    as _i3;
import 'package:veegil_bank/features/authentication/data/models/login_user_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLoginUserModel_0 extends _i1.SmartFake
    implements _i2.LoginUserModel {
  _FakeLoginUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LoginUserDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUserDataSource extends _i1.Mock
    implements _i3.LoginUserDataSource {
  @override
  _i4.Future<_i2.LoginUserModel> loginUser(
          Map<String, dynamic>? loginRequestBody) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [loginRequestBody],
        ),
        returnValue: _i4.Future<_i2.LoginUserModel>.value(_FakeLoginUserModel_0(
          this,
          Invocation.method(
            #loginUser,
            [loginRequestBody],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.LoginUserModel>.value(_FakeLoginUserModel_0(
          this,
          Invocation.method(
            #loginUser,
            [loginRequestBody],
          ),
        )),
      ) as _i4.Future<_i2.LoginUserModel>);
}

/// A class which mocks [ConnectivityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityService extends _i1.Mock
    implements _i5.ConnectivityService {
  @override
  _i4.Future<bool> isConnected() => (super.noSuchMethod(
        Invocation.method(
          #isConnected,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
