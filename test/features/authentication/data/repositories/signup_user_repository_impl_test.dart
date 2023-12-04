import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';
import 'package:veegil_bank/features/authentication/data/data_sources/remote/signup_data_source.dart';
import 'package:veegil_bank/features/authentication/data/models/signup_user_model.dart';
import 'package:veegil_bank/features/authentication/data/repositories/signup_user_repository.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'signup_user_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SignupDataSource>()])
@GenerateNiceMocks([MockSpec<ConnectivityService>()])
void main() {
  late SignupUserRepositoryImpl signupUserRepositoryImpl;
  late MockConnectivityService mockConnectivityService;
  late MockSignupDataSource mockSignupDataSource;

  setUp(() {
    mockSignupDataSource = MockSignupDataSource();
    mockConnectivityService = MockConnectivityService();
    signupUserRepositoryImpl = SignupUserRepositoryImpl(
        mockConnectivityService, mockSignupDataSource);
  });

  test(
    'should check if the device is online',
    () async {
      // arrange
      when(mockConnectivityService.isConnected())
          .thenAnswer((realInvocation) async => true);

      //act
      await signupUserRepositoryImpl.signupUser(signupUserRequestBody: {});

      // assert
      verify(mockConnectivityService.isConnected());
    },
  );
  group('when the device is online', () {
    test(
        'should return data of type [SignupUserModel] '
        'when the status code of the response 200', () {
      /// arrange
      final tSignupUserModel = SignupUserModel.fromJson(
          json.decode(fixture('signup.json')) as Map<String, dynamic>);


      final tResponse = Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: json.decode(fixture('signup.json')) as Map<String, dynamic>);

      /// act
      when(mockSignupDataSource.signupUser(any))
          .thenAnswer((realInvocation) async => tSignupUserModel);

      when(mockConnectivityService.isConnected())
          .thenAnswer((realInvocation) async => true);

      final result = signupUserRepositoryImpl
          .signupUser(signupUserRequestBody: <String, dynamic>{});

      /// assert
      verify(mockSignupDataSource.signupUser(any));


    });
  });
  group('when the device is offline', () {});
}
