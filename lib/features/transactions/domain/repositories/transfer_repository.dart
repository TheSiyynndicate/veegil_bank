import 'package:veegil_bank/features/transactions/domain/entities/transfer_entity.dart';

abstract class TransferRepository{
  Future<TransferEntity> transferFunds(int amount);
}