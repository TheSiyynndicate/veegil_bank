import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:veegil_bank/core/exceptions/authentication_exception.dart';
import 'package:veegil_bank/core/exceptions/network_exception.dart';

import 'package:veegil_bank/features/authentication/domain/repositories/login_user_repository.dart';
import 'package:veegil_bank/features/authentication/domain/repositories/signup_user_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

@Singleton()
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final phoneNumberTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  final SignupUserRepository signupUserRepositoryImpl;
  final LoginUserRepository loginUserRepositoryImpl;

  AuthenticationBloc(
      this.signupUserRepositoryImpl, this.loginUserRepositoryImpl)
      : super(AuthenticationInitial()) {
    on<AuthenticationEventLogin>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthenticationEventSignup>((event, emit) async {
      final phoneNumber = phoneNumberTextEditingController.text;
      final password = passwordTextEditingController.text;
      final confirmPassword = confirmPasswordTextEditingController.text;

      emit(AuthenticationStateLoading());
      try {
        final response = await signupUserRepositoryImpl.signupUser(
            signupUserRequestBody: {
              "phoneNumber": phoneNumber,
              "password": password
            });
        emit(AuthenticationStateSuccessful());
      } on NetworkException catch (exception) {

        emit(AuthenticationStateError());

      } on AuthenticationException catch (exception) {
        emit(AuthenticationStateError());
      }
    });
  }
}
