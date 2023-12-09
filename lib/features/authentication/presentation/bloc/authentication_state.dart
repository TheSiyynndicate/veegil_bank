part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationStateLoading extends AuthenticationState {}
class AuthenticationStateError extends AuthenticationState {
  final String message;
  AuthenticationStateError(this.message);

}
class AuthenticationStateSuccessful extends AuthenticationState {}

