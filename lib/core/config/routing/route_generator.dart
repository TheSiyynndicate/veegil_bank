import 'package:flutter/material.dart';

import 'package:veegil_bank/core/constants/route_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';
import 'package:veegil_bank/features/authentication/presentation/pages/signup_page.dart';
import 'package:veegil_bank/features/transactions/presentation/pages/dashboard_page.dart';

/// All routes should be registered in the format below.
/// Allows the passing of arguments instead of
/// directly being passed through the
/// constructor of the pages.

class RouteGenerator {
  /// /Will return the route selected as an argument
   static Route<dynamic> generateRoute(RouteSettings settings) {
    /// Getting arguments passed in while calling
    /// Navigator.pushNamed
    /// final args = settings.arguments;

    if (settings.name == sl<RouteConstants>().authenticationPage) {
      return MaterialPageRoute(builder: (_) => const SignupPage());
    }else  if (settings.name == sl<RouteConstants>().dashboardPage) {
      return MaterialPageRoute(builder: (_) => const DashboardPage());
    } else {
      /// If there is no such
      /// named route in the switch statement, e.g. /third
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return const Scaffold(
          body: Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Center(
              child: Text(
                'Page no longer exist',
              ),
            ),
          ),
        );
      },
    );
  }
}
