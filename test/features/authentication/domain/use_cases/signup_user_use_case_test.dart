import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';

import 'package:veegil_bank/features/authentication/domain/repositories/signup_user_repository.dart';
import 'package:veegil_bank/features/authentication/domain/use_cases/signup_user_use_case.dart';

import 'signup_user_use_case_test.mocks.dart';





@GenerateNiceMocks([MockSpec<SignupUserRepository>()])
void main() {
  late SignupUserUseCase signupUserUseCase;
  late MockSignupUserRepository mockSignupUserRepository;

  final tRequestBody = <String, dynamic>{
    'phoneNumber': '+2349012345678',
    'password': 'pass',
  };

  const tSignupUserEntity = SignupUserEntity(
    status: 'success',
    message: 'Signup successful',
    data: Data(
      phoneNumber: '+2349012345678',
      created: '2023-12-02T13:32:35.436Z',
    ),
  );

  setUp(() {
    mockSignupUserRepository = MockSignupUserRepository();
    signupUserUseCase = SignupUserUseCase(mockSignupUserRepository);
  });

  test('should successfully return data of type [SignupUserEntity] '
      'from the [AuthenticationRepository]', () async {
    /// arrange
    when(
      mockSignupUserRepository.signupUser(
        signupUserRequestBody: anyNamed('signupUserRequestBody'),
      ),
    ).thenAnswer((realInvocation) async => tSignupUserEntity);

    /// act
    final result = await signupUserUseCase(
      params: Params(data: tRequestBody),
    );

    /// assert
    ///
    expect(result, tSignupUserEntity);

    ///
    verify(
      mockSignupUserRepository.signupUser(
        signupUserRequestBody: tRequestBody,
      ),
    );

    ///
    verifyNoMoreInteractions(mockSignupUserRepository);
  });
}
