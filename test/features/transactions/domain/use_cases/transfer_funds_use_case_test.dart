import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/transactions/domain/entities/transfer_entity.dart';
import 'package:veegil_bank/features/transactions/domain/repositories/transfer_repository.dart';
import 'package:veegil_bank/features/transactions/domain/use_cases/transfer_funds_use_cases.dart';

import 'transfer_funds_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TransferRepository>()])
void main() {
  late TransferFundsUseCase transferFundsUseCase;
  late MockTransferRepository mockTransferRepository;

  setUp(() {
    mockTransferRepository = MockTransferRepository();
    transferFundsUseCase = TransferFundsUseCase(mockTransferRepository);
  });

  test('should return data of type [TransferEntity] ', () async {
    /// arrange
    final tTransferEntity = TransferEntity(
        status: "success",
        message: "transfer successful",
        data: Data(sent: 200));

    /// act
    when(mockTransferRepository.transferFunds(any))
        .thenAnswer((realInvocation) async => tTransferEntity);

    final result =  await  transferFundsUseCase(
        params: const Params(data: <String, dynamic>{'amount': 200}));

    /// assert
    verify(mockTransferRepository.transferFunds(any));

    expect(result, tTransferEntity);

    verifyNoMoreInteractions(mockTransferRepository);

  });
}
