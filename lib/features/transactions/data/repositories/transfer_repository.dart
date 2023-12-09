import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/network_exception.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/transactions/data/data_sources/remote/transfer_data_source.dart';
import 'package:veegil_bank/features/transactions/domain/entities/transfer_entity.dart';
import 'package:veegil_bank/features/transactions/domain/repositories/transfer_repository.dart';

class TransferRepositoryImpl implements TransferRepository {
  final TransferDataSource transferDataSource;
  final InternetChecker internetChecker;

  TransferRepositoryImpl(this.transferDataSource, this.internetChecker);

  @override
  Future<TransferEntity> transferFunds(int amount) async {
    final internetStatus = await internetChecker.isInternetAvailable();

    if (internetStatus) {
      return (await transferDataSource.transferFunds(amount))!;
    } else {
      throw NetworkException(
          exceptionMessage: sl<ExceptionsErrorMessagesConstants>()
              .networkExceptionNoInternet);
    }
  }
}
