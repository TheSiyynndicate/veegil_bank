import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class AppColorConstants {
  /// The [primary] color will be the most dominant color within
  /// the application. Commonly called Sapphire.
  Color get primary;

  /// The [secondary] color will be the second most dominant color within
  /// the application. Commonly called Ash or Anti-flash white.
  Color get secondary;

  /// The [error] color will be used for indicating error or failure within
  /// the application. Commonly called Red Crayola.
  Color get error;

  /// The [white] color will be used for background, surfaces,
  /// text and other common uses through out the app.
  /// Adding common colors makes it easier to switch themes
  /// throughout the application
  Color get white;

  /// The [black] color will be used for background, surfaces,
  /// text and other common uses through out the app and a
  /// contrast to white
  /// Adding common colors makes it easier to switch themes
  /// throughout the application
  Color get black;
}

@LazySingleton(as: AppColorConstants)
class ColorConstants implements AppColorConstants {
  @override
  Color get primary => const Color.fromRGBO(3, 83, 164, 1);

  @override
  Color get secondary => const Color.fromRGBO(235, 235, 235, 1);

  @override
  Color get error => const Color.fromRGBO(232, 49, 81, 1);

  @override
  Color get black => const Color.fromRGBO(0, 0, 0, 1) ;

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);
}
