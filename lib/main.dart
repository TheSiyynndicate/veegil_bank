import 'package:flutter/material.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/app/presentation/pages/app.dart';

void main() {
  configureDependencies();
  runApp(const App());
}


