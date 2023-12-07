import 'package:flutter/material.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: sl<AppColorConstants>().white),
        ),
      ),
    );
  }
}
