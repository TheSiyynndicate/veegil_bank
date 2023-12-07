import 'package:flutter/material.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/constants/asset_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/presentation/widgets/top_tab_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    final activeBorder = OutlineInputBorder(
      borderSide: BorderSide(color: sl<AppColorConstants>().primary),
      borderRadius: BorderRadius.circular(20),
    );
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone number',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        color: sl<AppColorConstants>().black),
                              ),
                              Spacer(),
                              TextFormField(
                                cursorColor: sl<AppColorConstants>().primary,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    constraints: BoxConstraints.tight(
                                        Size.fromHeight(
                                            MediaQuery.of(context).size.height *
                                                0.06)),
                                    filled: true,
                                    fillColor:
                                        sl<AppColorConstants>().secondary,
                                    border: border,
                                    enabledBorder: border,
                                    focusedBorder: activeBorder),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone number',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        color: sl<AppColorConstants>().black),
                              ),
                              Spacer(),
                              TextFormField(
                                cursorColor: sl<AppColorConstants>().primary,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    constraints: BoxConstraints.tight(
                                        Size.fromHeight(
                                            MediaQuery.of(context).size.height *
                                                0.06)),
                                    filled: true,
                                    fillColor:
                                        sl<AppColorConstants>().secondary,
                                    border: border,
                                    enabledBorder: border,
                                    focusedBorder: activeBorder),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone number',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        color: sl<AppColorConstants>().black),
                              ),
                              Spacer(),
                              TextFormField(
                                cursorColor: sl<AppColorConstants>().primary,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    constraints: BoxConstraints.tight(
                                        Size.fromHeight(
                                            MediaQuery.of(context).size.height *
                                                0.06)),
                                    filled: true,
                                    fillColor:
                                        sl<AppColorConstants>().secondary,
                                    border: border,
                                    enabledBorder: border,
                                    focusedBorder: activeBorder),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: sl<AppColorConstants>().white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
