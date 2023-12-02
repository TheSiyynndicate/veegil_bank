import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';
import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';

/// Contract abstract for the authentication repository
abstract class AuthenticationRepository {
  /// To be used for user registration
  Future<SignupUserEntity?> signupUser({
    required Map<String, dynamic> signupUserRequestBody,
  });

  /// To be used to login an already registered
  /// user
  Future<LoginUserEntity?> loginUser({
    required Map<String, dynamic> loginUserRequestBody,
  });
}
