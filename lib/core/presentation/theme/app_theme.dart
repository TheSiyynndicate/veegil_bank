import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';

abstract class AppTheme {
  ThemeData get themeData;
}

@LazySingleton(as: AppTheme)
class AppThemeData implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme(
            background: Colors.white,
            brightness: Brightness.light,
            error: sl<AppColorConstants>().error,
            onError: sl<AppColorConstants>().error,
            primary: sl<AppColorConstants>().primary,
            onPrimary: sl<AppColorConstants>().primary,
            secondary: sl<AppColorConstants>().secondary,
            onSecondary: sl<AppColorConstants>().secondary,
            onBackground: Colors.white,
            surface: Colors.white,
            onSurface: Colors.white),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          textStyle:
              MaterialStateProperty.resolveWith((states) => const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 0.1,
                  )),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return sl<AppColorConstants>().primary.withOpacity(0.5);
            } else {
              return sl<AppColorConstants>().primary;
            }
          }),
        )),
        textTheme: const TextTheme(
          labelSmall: TextStyle(
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w300),
          labelMedium: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w300),
          labelLarge: TextStyle(
              color: Colors.black,
              fontSize: 25,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500),
        ),
      );
}
