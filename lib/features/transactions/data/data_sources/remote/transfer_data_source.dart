import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:veegil_bank/core/constants/api_endpoint_constants.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/transaction_exception.dart';
import 'package:veegil_bank/core/network/client_generator/client_generator.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/transactions/data/models/transfer_model.dart';

abstract class TransferDataSource {
  Future<TransferModel?> transferFunds(num amount);
}

@Injectable(as: TransferDataSource)
class TransferDataSourceImpl implements TransferDataSource {
  final ClientGenerator clientGenerator;

  TransferDataSourceImpl(this.clientGenerator);

  @override
  Future<TransferModel?> transferFunds(num amount) async {
    final response =
        await clientGenerator.post(sl<ApiEndpointConstants>().transfer);

    if (response?.statusCode == 200) {
      return TransferModel.fromJson(response!.data as Map<String,dynamic>);
    } else {
      throw TransactionException(
          exceptionMessage: sl<ExceptionsErrorMessagesConstants>()
              .transactionExceptionFailed);
    }
  }
}
