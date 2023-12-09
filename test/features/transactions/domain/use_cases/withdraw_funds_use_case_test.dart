import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/transactions/domain/entities/withdraw_entity.dart';
import 'package:veegil_bank/features/transactions/domain/repositories/withdraw_repository.dart';
import 'package:veegil_bank/features/transactions/domain/use_cases/withdraw_funds_use_case.dart';

import 'withdraw_funds_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WithdrawRepository>()])
void main() {
  late MockWithdrawRepository mockWithdrawRepository;
  late WithdrawFundsUseCase withdrawFundsUseCase;

  setUp(() {
    mockWithdrawRepository = MockWithdrawRepository();
    withdrawFundsUseCase = WithdrawFundsUseCase(mockWithdrawRepository);
  });
  test('should return data of type [WithdrawEntity] ', () async{
    /// arrange
    final tWithdrawEntity = WithdrawEntity(
      status: 'success',
      message: 'Withdrawal successful',
      data: Data(
        withdrawal: 200
      )
    );
    /// act
    when(mockWithdrawRepository.withdrawFunds(any)).thenAnswer((realInvocation) async => tWithdrawEntity);

    final result = await withdrawFundsUseCase(params: const Params(data: <String,dynamic>{
      'amount':200
    }));
    /// assert
    verify(mockWithdrawRepository.withdrawFunds(any));

    expect(result, tWithdrawEntity);

    verifyNoMoreInteractions(mockWithdrawRepository);
  });
}
