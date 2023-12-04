import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/constants/api_endpoint_constants.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/network/client_generator/client_generator.dart';
import 'package:veegil_bank/features/authentication/data/data_sources/remote/login_user_data_source.dart';
import 'package:veegil_bank/features/authentication/data/models/login_user_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'login_user_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DioClient>()])
void main() {
  late LoginUserDataSourceImpl loginUserDataSourceImpl;
  late MockDioClient mockDioClient;
  late GetIt getIt;

  setUp(() {
    mockDioClient = MockDioClient();
    loginUserDataSourceImpl = LoginUserDataSourceImpl(mockDioClient);
  });

  setUpAll(() {
    getIt = GetIt.instance
      ..registerLazySingleton<ApiEndpointConstants>(ApiConstants.new)
      ..registerLazySingleton<ExceptionsErrorMessagesConstants>(
          ExceptionConstants.new);
  });
  group('loginUser', () {
    test(
        'should successfully return data of type [LoginUserModel] '
        'when the status code is 200', () async {
      /// arrange
      final tLoginJsonData =
          json.decode(fixture('login.json')) as Map<String, dynamic>;

      final tResponse = Response(
          requestOptions:
              RequestOptions(baseUrl: getIt<ApiEndpointConstants>().baseUrl),
          data: tLoginJsonData,
          statusCode: 200);

      final tLoginUserModel = LoginUserModel.fromJson(tLoginJsonData);

      /// act
      when(mockDioClient.post(getIt<ApiEndpointConstants>().login,
              requestBody: anyNamed('requestBody')))
          .thenAnswer((realInvocation) async => tResponse);

      final result = await loginUserDataSourceImpl.loginUser({});

      /// assert
      verify(mockDioClient.post(getIt<ApiEndpointConstants>().login,
          requestBody: <String, dynamic>{}));

      expect(
          result,
          const LoginUserModel(
            status: 'success',
            message: 'Login successful',
            data: DataModel(token: 'dummy.veegil.token'),
          ));
    });
  });
}
