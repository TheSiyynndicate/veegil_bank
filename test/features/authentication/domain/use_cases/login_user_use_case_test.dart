import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';

import 'package:veegil_bank/features/authentication/domain/repositories/login_user_repository.dart';
import 'package:veegil_bank/features/authentication/domain/use_cases/login_user_use_case.dart';

import 'login_user_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginUserRepository>()])
void main() {
  late LoginUserUseCase loginUserUseCase;
  late MockLoginUserRepository mockLoginUserRepository;

  final tRequestBody = <String, dynamic>{
    'phoneNumber': '+2349012345678',
    'password': 'pass',
  };

  const tLoginUserEntity = LoginUserEntity(
    status: 'success',
    message: 'Login successful',
    data: Data(token: 'dummy.veegil.token'),
  );

  setUp(() {
    mockLoginUserRepository = MockLoginUserRepository();
    loginUserUseCase = LoginUserUseCase(mockLoginUserRepository);
  });

  test(
      'should successfully return data of type [LoginUserEntity] '
      'from the [AuthenticationRepository]', () async {
    /// arrange
    when(
      mockLoginUserRepository.loginUser(
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
      mockLoginUserRepository.loginUser(
        loginUserRequestBody: tRequestBody,
      ),
    );

    ///
    verifyNoMoreInteractions(mockLoginUserRepository);
  });
}
