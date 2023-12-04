import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/constants/api_endpoint_constants.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/network/client_generator/client_generator.dart';
import 'package:veegil_bank/features/authentication/data/data_sources/remote/signup_data_source.dart';
import 'package:veegil_bank/features/authentication/data/models/signup_user_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'signup_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DioClient>()])
void main() {
  late SignupDataSourceImpl signupDataSource;
  late MockDioClient mockDioClient;
  late GetIt getIt;

  setUp(() {
    mockDioClient = MockDioClient();
    signupDataSource = SignupDataSourceImpl(mockDioClient);
  });

  setUpAll(() {
    getIt = GetIt.instance
      ..registerLazySingleton<ApiEndpointConstants>(ApiConstants.new)
      ..registerLazySingleton<ExceptionsErrorMessagesConstants>(
          ExceptionConstants.new);
  });
  group('signupUser', () {
    test(
        'should successfully return data of type [SignupUserModel] '
        'when the status code is 200', () async {
      /// arrange
      final tSignupJsonData =
          json.decode(fixture('signup.json')) as Map<String, dynamic>;

      final tResponse = Response(
          requestOptions:
              RequestOptions(baseUrl: getIt<ApiEndpointConstants>().baseUrl),
          data: tSignupJsonData,
          statusCode: 200);

      final tSignupUserModel = SignupUserModel.fromJson(tSignupJsonData);

      /// act
      when(mockDioClient.post(getIt<ApiEndpointConstants>().signup,
              requestBody: anyNamed('requestBody')))
          .thenAnswer((realInvocation) async => tResponse);

      final result = await signupDataSource.signupUser({});

      /// assert
      verify(mockDioClient.post(getIt<ApiEndpointConstants>().signup,
          requestBody: <String, dynamic>{}));

      expect(
          result,
          const SignupUserModel(
            status: 'success',
            message: 'Signup successful',
            data: DataModel(
                phoneNumber: '+2349012345678',
                created: '2023-12-02T13:32:35.436Z'),
          ));
    });
  });
}
