import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';

import 'package:veegil_bank/features/authentication/domain/repositories/signup_user_repository.dart';

class SignupUserUseCase implements UseCase<SignupUserEntity, Params> {
  final SignupUserRepository signupUserRepository;

  SignupUserUseCase(this.signupUserRepository);

  @override
  Future<SignupUserEntity?> call({required Params? params}) {
    return signupUserRepository.signupUser(
      signupUserRequestBody: params!.data,);
  }




}
