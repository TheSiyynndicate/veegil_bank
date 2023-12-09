import 'package:veegil_bank/core/use_cases/use_case.dart';
import 'package:veegil_bank/features/transactions/domain/entities/withdraw_entity.dart';
import 'package:veegil_bank/features/transactions/domain/repositories/withdraw_repository.dart';

class WithdrawFundsUseCase   implements UseCase<WithdrawEntity, Params>{
  final WithdrawRepository withdrawRepository;


  WithdrawFundsUseCase(this.withdrawRepository);

  @override
  Future<WithdrawEntity?> call({required Params? params}) {
    return withdrawRepository.withdrawFunds(params?.data['amount'] as int);
  }

}