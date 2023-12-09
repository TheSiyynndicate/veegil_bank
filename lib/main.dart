import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/core/utils/global_bloc_observer.dart';
import 'package:veegil_bank/features/app/presentation/pages/app.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();
  configureDependencies();

  runApp(const App());
}


