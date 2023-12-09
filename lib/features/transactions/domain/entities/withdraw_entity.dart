import 'package:equatable/equatable.dart';

class WithdrawEntity extends Equatable {
  String? status;
  String? message;
  Data? data;

  WithdrawEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  @override
  bool get stringify => true;
}

class Data extends Equatable {
  num? withdrawal;

  Data({this.withdrawal});

  @override
  List<Object?> get props => [withdrawal];

  @override
  bool get stringify => true;
}
