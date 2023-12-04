import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/authentication_exception.dart';
import 'package:veegil_bank/core/exceptions/network_exception.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';
import 'package:veegil_bank/features/authentication/data/data_sources/remote/login_user_data_source.dart';
import 'package:veegil_bank/features/authentication/data/models/login_user_model.dart';
import 'package:veegil_bank/features/authentication/data/repositories/login_user_repository.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_user_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginUserDataSource>()])
@GenerateNiceMocks([MockSpec<ConnectivityService>()])
void main() {
  late LoginUserRepositoryImpl loginUserRepositoryImpl;
  late MockLoginUserDataSource mockLoginUserDataSource;
  late MockConnectivityService mockConnectivityService;

  late GetIt getIt;
  setUp(() {
    mockConnectivityService = MockConnectivityService();
    mockLoginUserDataSource = MockLoginUserDataSource();
    loginUserRepositoryImpl = LoginUserRepositoryImpl(
        mockLoginUserDataSource, mockConnectivityService);
  });

  setUpAll(() => getIt = GetIt.instance
    ..registerLazySingleton<ExceptionsErrorMessagesConstants>(
        ExceptionConstants.new));

  test(
    'should check if the device is online',
    () async {
      // arrange
      when(mockConnectivityService.isConnected())
          .thenAnswer((realInvocation) async => true);

      //act
      await loginUserRepositoryImpl.loginUser(loginUserRequestBody: {});

      // assert
      verify(mockConnectivityService.isConnected());
    },
  );

  group('when the device has internet connection', () {
    test(
        'should return data of type [LoginUserEntity] a '
        'successful response has been received', () async {
      /// arrange
      final tJsonData =
          json.decode(fixture('login.json')) as Map<String, dynamic>;
      final tLoginUserModel = LoginUserModel.fromJson(tJsonData);

      /// act
      when(mockLoginUserDataSource.loginUser(any))
          .thenAnswer((realInvocation) async => tLoginUserModel);
      when(mockConnectivityService.isConnected())
          .thenAnswer((realInvocation) async => true);

      final result = await loginUserRepositoryImpl
          .loginUser(loginUserRequestBody: <String, dynamic>{});
      //
      /// assert
      verify(mockLoginUserDataSource.loginUser(any));
    });

    test(
        'should throw an [AuthenticationException] '
        'when the request is unsuccessful', () async {
      /// arrange
      final tJsonData =
          json.decode(fixture('login.json')) as Map<String, dynamic>;
      final tLoginUserModel = LoginUserModel.fromJson(tJsonData);

      /// act
      when(mockLoginUserDataSource.loginUser(any)).thenThrow(
          AuthenticationException(
              exceptionMessage: getIt<ExceptionsErrorMessagesConstants>()
                  .authenticationExceptionLoginAttemptFailed));

      when(mockConnectivityService.isConnected())
          .thenAnswer((realInvocation) async => true);

      expect(
          () async => loginUserRepositoryImpl
              .loginUser(loginUserRequestBody: <String, dynamic>{}),
          throwsA(isA<AuthenticationException>()));
      // //
      // final result = await loginUserRepositoryImpl
      //     .loginUser(loginUserRequestBody: <String, dynamic>{});
      //
      /// assert
      // verify(mockLoginUserDataSource.loginUser(any));
    });
  });

  group('when the device is offline', () {
    test('should throw a [NetworkException] when a request is made ', () async {
      /// arrange
      final tJsonData =
          json.decode(fixture('login.json')) as Map<String, dynamic>;
      final tLoginUserModel = LoginUserModel.fromJson(tJsonData);

      /// act
      when(mockLoginUserDataSource.loginUser(any)).thenThrow(NetworkException(
          exceptionMessage: getIt<ExceptionsErrorMessagesConstants>()
              .networkExceptionNoInternet));

      when(mockConnectivityService.isConnected())
          .thenAnswer((realInvocation) async => false);

      /// assert
      expect(
          () async => loginUserRepositoryImpl
              .loginUser(loginUserRequestBody: <String, dynamic>{}),
          throwsA(isA<NetworkException>()));
    });
  });
}
