import 'package:equatable/equatable.dart';

class TransferEntity extends Equatable {
  String? status;
  String? message;
  Data? data;

  TransferEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  @override
  bool get stringify => true;
}

class Data extends Equatable {
  num? sent;

  Data({this.sent});

  @override
  List<Object?> get props => [sent];

  @override
  bool get stringify => true;
}
