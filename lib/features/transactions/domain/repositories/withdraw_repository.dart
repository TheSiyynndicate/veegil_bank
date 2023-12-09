import 'package:veegil_bank/features/transactions/domain/entities/withdraw_entity.dart';

abstract class WithdrawRepository{
  Future<WithdrawEntity> withdrawFunds(int amount);
}