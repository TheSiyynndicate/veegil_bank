import 'package:veegil_bank/features/transactions/domain/entities/transfer_entity.dart';

class TransferModel extends TransferEntity {
  TransferModel({super.status, super.message, super.data});

  factory TransferModel.fromJson(Map<String, dynamic> json) {
    return TransferModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] != null
          ? DataModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = (this.data as DataModel).toJson();
    }
    return data;
  }
}

class DataModel extends Data {
  DataModel({super.sent});

  DataModel.fromJson(Map<String, dynamic> json) {
    sent = json['sent'] as num;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sent'] = this.sent;
    return data;
  }
}
