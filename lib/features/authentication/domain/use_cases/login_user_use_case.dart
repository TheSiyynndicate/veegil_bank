import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';

import 'package:veegil_bank/features/authentication/domain/repositories/login_user_repository.dart';

class LoginUserUseCase implements UseCase<LoginUserEntity, Params> {
  final LoginUserRepository loginUserRepository;

  LoginUserUseCase(this.loginUserRepository);

  @override
  Future<LoginUserEntity?> call({required Params? params}) {
    return loginUserRepository.loginUser(
      loginUserRequestBody: params!.data,
    );
  }
}
