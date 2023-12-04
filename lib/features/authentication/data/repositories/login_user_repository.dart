import 'package:veegil_bank/core/constants/exception_message_constants.dart';

import 'package:veegil_bank/core/exceptions/network_exception.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/data/data_sources/remote/login_user_data_source.dart';
import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';
import 'package:veegil_bank/features/authentication/domain/repositories/login_user_repository.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  LoginUserRepositoryImpl(this.loginUserDataSource, this.connectivityService);

  final LoginUserDataSource loginUserDataSource;
  final ConnectivityService connectivityService;

  @override
  Future<LoginUserEntity?> loginUser(
      {required Map<String, dynamic> loginUserRequestBody}) async {

    final isConnected = await connectivityService.isConnected();

    if (isConnected) {

        final loginUserEntity =
            await loginUserDataSource.loginUser(loginUserRequestBody);

        return loginUserEntity;

    } else {
      throw NetworkException(
          exceptionMessage: sl<ExceptionsErrorMessagesConstants>()
              .networkExceptionNoInternet);
    }
  }
}
