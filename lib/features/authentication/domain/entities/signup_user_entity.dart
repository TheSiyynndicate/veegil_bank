import 'package:equatable/equatable.dart';

/// [SignupUserEntity] is the base structure for a
/// successful signup response from the endpoint
/// '/auth/signup'
class SignupUserEntity extends Equatable {
  /// [SignupUserEntity] default constructor.
  /// No required parameters.
  const SignupUserEntity({this.status, this.message, this.data});

  /// Meant to denote the [status] of the
  /// response. Values may be "success", "error" e.t.c
  final String? status;

  /// Will relay the [status] in more
  /// detail.
  final String? message;

  /// [Data] is a type of [SignupUserEntity].
  /// Will contain the phone number which
  /// will serve as an account number and
  /// Date of the created account.
  final Data? data;

  @override
  List<Object?> get props => [status, message, data];

  @override
  bool get stringify => true;
}

/// [Data] is a subclass of [SignupUserEntity]
class Data extends Equatable {
  /// [Data] default constructor.
  /// No required parameters.
  const Data({this.phoneNumber, this.created});

  /// Variable to hold the phone number of the
  /// registrant which will be used as an
  /// account number
  final String? phoneNumber;

  /// The date and time of the
  /// registration
  final String? created;

  @override
  List<Object?> get props => [phoneNumber, created];

  @override
  bool get stringify => true;
}
