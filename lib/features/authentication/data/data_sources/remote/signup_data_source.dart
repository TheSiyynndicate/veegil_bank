import 'package:veegil_bank/core/constants/api_endpoint_constants.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/authentication_exception.dart';
import 'package:veegil_bank/core/network/client_generator/client_generator.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/data/models/signup_user_model.dart';

abstract class SignupDataSource {
  Future<SignupUserModel?> signupUser(Map<String, dynamic> signupRequestBody);
}

class SignupDataSourceImpl implements SignupDataSource {
  final ClientGenerator clientGenerator;

  SignupDataSourceImpl(this.clientGenerator);

  @override
  Future<SignupUserModel?> signupUser(
      Map<String, dynamic> signupRequestBody) async {
    final response = await clientGenerator.post(
        sl<ApiEndpointConstants>().signup,
        requestBody: signupRequestBody);

    if (response?.statusCode == 200) {
      return SignupUserModel.fromJson(response?.data as Map<String, dynamic>);
    } else {
      throw AuthenticationException(
          exceptionMessage: response?.statusCode == 400
              ? sl<ExceptionsErrorMessagesConstants>()
                  .authenticationExceptionAlreadyRegistered
              : sl<ExceptionsErrorMessagesConstants>()
                  .authenticationExceptionInvalidSignupData);
    }
  }
}
