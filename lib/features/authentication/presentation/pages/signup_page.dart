import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank/core/constants/asset_constants.dart';
import 'package:veegil_bank/core/presentation/widgets/text_field_widget/button_widget.dart';
import 'package:veegil_bank/core/presentation/widgets/text_field_widget/loading_widget.dart';
import 'package:veegil_bank/core/presentation/widgets/text_field_widget/widgets/text_field_widget.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:veegil_bank/features/authentication/presentation/widgets/top_tab_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                const TopTabWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    sl<AssetConstants>().signup,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFieldWidget(
                          label: 'Phone number',
                          textEditingController: sl<AuthenticationBloc>()
                              .phoneNumberTextEditingController,
                        ),
                        TextFieldWidget(
                          label: 'Password',
                          textEditingController: sl<AuthenticationBloc>()
                              .passwordTextEditingController,
                          textFieldWidgetType: TextFieldWidgetType.password,
                        ),
                        TextFieldWidget(
                          label: 'Confirm password',
                          textEditingController: sl<AuthenticationBloc>()
                              .confirmPasswordTextEditingController,
                          textFieldWidgetType: TextFieldWidgetType.password,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocListener<AuthenticationBloc, AuthenticationState>(
                  bloc: sl<AuthenticationBloc>(),
                  listener: (context, state) async {
                    if (state is AuthenticationStateSuccessful) {
                      Navigator.pushNamed(context, 'Dash');
                    } else if (state is AuthenticationStateError) {

                    } else if (state is AuthenticationStateLoading) {
                      unawaited(showLoader(context: context));
                    }
                  },
                  listenWhen: (previous, current) {
                    if (previous is AuthenticationStateLoading) {
                      print('previous AuthenticationStateLoading');
                      Navigator.pop(context);
                    }
                    if (previous != current) {
                      return true;
                    }
                    return false;
                  },
                  child: ButtonWidget(
                      label: 'Sign Up',
                      onPressed: () => sl<AuthenticationBloc>()
                          .add(AuthenticationEventSignup())),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
