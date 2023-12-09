import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/transactions/domain/entities/transfer_entity.dart';
import 'package:veegil_bank/features/transactions/domain/repositories/transfer_repository.dart';

class TransferFundsUseCase implements UseCase<TransferEntity, Params> {
  final TransferRepository transferRepository;

  TransferFundsUseCase(this.transferRepository);

  @override
  Future<TransferEntity?> call({required Params? params}) {
    return transferRepository.transferFunds(params!.data['amount'] as int);
  }
}
