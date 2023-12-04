
import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';

/// Contract abstract for the authentication repository
abstract class SignupUserRepository {
  /// To be used for user registration
  Future<SignupUserEntity?> signupUser({
    required Map<String, dynamic> signupUserRequestBody,
  });
}
