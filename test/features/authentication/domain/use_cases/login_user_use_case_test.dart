import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';
import 'package:veegil_bank/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:veegil_bank/features/authentication/domain/use_cases/login_user_use_case.dart';

import 'login_user_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthenticationRepository>()])
void main() {
  late LoginUserUseCase loginUserUseCase;
  late MockAuthenticationRepository mockAuthenticationRepository;

  final tRequestBody = <String, dynamic>{
    'phoneNumber': '+2349012345678',
    'password': 'pass',
  };

  final tLoginUserEntity = LoginUserEntity(
    status: 'success',
    message: 'Login successful',
    data: const Data(token: 'dummy.veegil.token'),
  );

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    loginUserUseCase = LoginUserUseCase(mockAuthenticationRepository);
  });

  test(
      'should successfully return data of type [LoginUserEntity] '
      'from the [AuthenticationRepository]', () async {
    /// arrange
    when(
      mockAuthenticationRepository.loginUser(
        loginUserRequestBody: anyNamed('loginUserRequestBody'),
      ),
    ).thenAnswer((realInvocation) async => tLoginUserEntity);

    /// act
    final result = await loginUserUseCase(
      params: Params(data: tRequestBody),
    );

    /// assert
    ///
    expect(result, tLoginUserEntity);

    ///
    ///
    verify(
      mockAuthenticationRepository.loginUser(
        loginUserRequestBody: tRequestBody,
      ),
    );

    ///
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
