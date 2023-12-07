
import 'package:flutter/material.dart';
import 'package:veegil_bank/core/presentation/theme/app_theme.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/presentation/pages/signup_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: sl<AppTheme>().themeData,
      home: SignupPage(),
    );
  }
}