import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  const LoginUserModel(
      {required super.status, required super.message, required super.data});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
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
      token: this.data?.token,
    ).toJson();
    return data;
  }
}

class DataModel extends Data {
  const DataModel({
    required super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['token'] = token;

    return data;
  }
}
