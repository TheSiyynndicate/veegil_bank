import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';

class SignupUserModel extends SignupUserEntity {
  const SignupUserModel(
      {required super.status, required super.message, required super.data});

  factory SignupUserModel.fromJson(Map<String, dynamic> json) {
    return SignupUserModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] != null
          ? DataModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = DataModel(
      phoneNumber: this.data?.phoneNumber,
      created: this.data?.created,
    ).toJson();
    return data;
  }
}

class DataModel extends Data {
  const DataModel({required super.phoneNumber, required super.created});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        phoneNumber: json['phoneNumber'] as String,
        created: json['created'] as String,);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['phoneNumber'] = phoneNumber;
    data['created'] = created;

    return data;
  }
}
