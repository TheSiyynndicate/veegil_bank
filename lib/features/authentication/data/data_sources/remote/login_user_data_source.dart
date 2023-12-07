import 'package:injectable/injectable.dart';
import 'package:veegil_bank/core/constants/api_endpoint_constants.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/authentication_exception.dart';
import 'package:veegil_bank/core/network/client_generator/client_generator.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/data/models/login_user_model.dart';

abstract class LoginUserDataSource {
  Future<LoginUserModel> loginUser(Map<String, dynamic> loginRequestBody);
}

@Injectable(as: LoginUserDataSource)
class LoginUserDataSourceImpl implements LoginUserDataSource {
  final ClientGenerator clientGenerator;

  @override
  Future<LoginUserModel> loginUser(
      Map<String, dynamic> loginRequestBody) async {
    final response = await clientGenerator.post(sl<ApiEndpointConstants>().login,
        requestBody: loginRequestBody);

    if (response?.statusCode == 200) {
      return LoginUserModel.fromJson(response?.data as Map<String, dynamic>);
    } else {
      throw AuthenticationException(
          exceptionMessage: sl<ExceptionsErrorMessagesConstants>()
              .authenticationExceptionLoginAttemptFailed);
    }
  }

  LoginUserDataSourceImpl(this.clientGenerator);
}
