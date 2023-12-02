import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';
import 'package:veegil_bank/features/authentication/domain/repositories/authentication_repository.dart';

class LoginUserUseCase implements UseCase<LoginUserEntity, Params> {
  final AuthenticationRepository authenticationRepository;

  LoginUserUseCase(this.authenticationRepository);

  @override
  Future<LoginUserEntity?> call({required Params? params}) {
    return authenticationRepository.loginUser(
      loginUserRequestBody: params!.data,
    );
  }
}
