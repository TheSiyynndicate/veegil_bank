import 'package:flutter/material.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';

class TopTabWidget extends StatelessWidget {
  const TopTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Material(
        color: sl<AppColorConstants>().secondary,
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return AnimatedAlign(
                alignment: Alignment.centerLeft,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: constraints.maxWidth * 0.5,
                  height: constraints.maxHeight,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: sl<AppColorConstants>().primary,
                  ),
                ),
              );
            }),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(child: Text('Sign Up', style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: sl<AppColorConstants>().white
                ))
                ),
                Text('Login', style: Theme.of(context).textTheme.labelSmall),
              ],
            )
          ],
        ),
      ),
    );
  }
}
