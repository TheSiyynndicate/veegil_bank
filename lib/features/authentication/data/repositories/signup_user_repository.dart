import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/network_exception.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/data/data_sources/remote/signup_data_source.dart';
import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';
import 'package:veegil_bank/features/authentication/domain/repositories/signup_user_repository.dart';

class SignupUserRepositoryImpl implements SignupUserRepository {
  SignupUserRepositoryImpl(this.connectivityService, this.signupDataSource);

  final SignupDataSource signupDataSource;
  final ConnectivityService connectivityService;

  @override
  Future<SignupUserEntity?> signupUser(
      {required Map<String, dynamic> signupUserRequestBody}) async {

    final isConnected = await connectivityService.isConnected();

    if (isConnected) {
      final signupUserEntity =
          await signupDataSource.signupUser(signupUserRequestBody);

      return signupUserEntity;
    } else {
      throw NetworkException(
          exceptionMessage: sl<ExceptionsErrorMessagesConstants>()
              .networkExceptionNoInternet);
    }
  }
}
