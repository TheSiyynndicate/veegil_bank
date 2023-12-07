part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {

}

class AuthenticationEventLogin extends AuthenticationEvent{}
class AuthenticationEventSignup extends AuthenticationEvent{}
