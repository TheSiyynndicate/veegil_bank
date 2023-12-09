import 'package:veegil_bank/features/transactions/domain/entities/withdraw_entity.dart';

class WithdrawModel extends WithdrawEntity {
  WithdrawModel({super.status, super.message, super.data});

  factory WithdrawModel.fromJson(Map<String, dynamic> json) {
    return WithdrawModel(
        status: json['status'] as String,
        message: json['message'] as String,
        data: json['data'] != null
            ? DataModel.fromJson(json['data'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = DataModel(withdrawal: this.data?.withdrawal).toJson();
    }
    return data;
  }
}

class DataModel extends Data {
  DataModel({super.withdrawal});

  DataModel.fromJson(Map<String, dynamic> json) {
    withdrawal = json['withdrawal'] as num;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['withdrawal'] = this.withdrawal;
    return data;
  }
}
