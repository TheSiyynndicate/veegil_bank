import 'package:flutter/material.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/presentation/widgets/text_field_widget/button_widget.dart';
import 'package:veegil_bank/core/service_locator.dart';

Future<void> showMyDialog(
    {required BuildContext context, required String message}) async {
  return showDialog<void>(
    context: context,
    useRootNavigator: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: sl<AppColorConstants>().white,
              borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: sl<AppColorConstants>().primary,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ))),
                ButtonWidget(
                onPressed: (){},
                label: 'Close',
              ),
            ],
          ),
        ),
      );
    },
  );
}
