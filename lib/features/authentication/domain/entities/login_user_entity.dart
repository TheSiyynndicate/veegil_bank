import 'package:equatable/equatable.dart';

/// [LoginUserEntity] is the base structure for a
/// successful login response from the endpoint
/// '/auth/login'
class LoginUserEntity extends Equatable {
  /// Default constructor for [LoginUserEntity] class.
  /// Has no required parameters.
  const LoginUserEntity({this.status, this.message, this.data});

  /// Meant to denote the [status] of the
  /// response. Values may be "success", "error" e.t.c
  final String? status;

  /// Will relay the [status] in more
  /// detail.
  final String? message;

  /// [Data] is a type of [LoginUserEntity].
  /// Will contain the a login
  /// token. The token will be used to make request
  final Data? data;

  @override
  List<Object?> get props => [status, message, data];

  @override
  bool get stringify => true;
}

/// [Data] is a type of [LoginUserEntity].
/// Will contain the token which
/// will be used to make API calls
class Data extends Equatable {
  /// [Data] default constructor.
  /// No required parameters.
  const Data({this.token});

  /// Token for meant as
  /// bearer auth for API calls
  final String? token;

  @override
  List<Object?> get props => [token];

  @override
  bool get stringify => true;
}
