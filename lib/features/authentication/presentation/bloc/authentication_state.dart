part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationStateLoading extends AuthenticationState {}
class AuthenticationStateError extends AuthenticationState {}
class AuthenticationStateSuccessful extends AuthenticationState {}

