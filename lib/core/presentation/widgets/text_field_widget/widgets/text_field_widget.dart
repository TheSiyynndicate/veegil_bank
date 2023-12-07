import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/presentation/widgets/text_field_widget/bloc/text_field_widget_cubit.dart';
import 'package:veegil_bank/core/service_locator.dart';

enum TextFieldWidgetType { text, password }

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.textEditingController,
      this.textFieldWidgetType = TextFieldWidgetType.text});

  final String label;
  final TextEditingController textEditingController;
  final TextFieldWidgetType textFieldWidgetType;

  @override
  Widget build(BuildContext context) {
    final textFieldWidgetCubit = TextFieldWidgetCubit();
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: sl<AppColorConstants>().error),
      borderRadius: BorderRadius.circular(20),
    );

    final activeBorder = OutlineInputBorder(
      borderSide: BorderSide(color: sl<AppColorConstants>().primary),
      borderRadius: BorderRadius.circular(20),
    );
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: sl<AppColorConstants>().black),
          ),
          const Spacer(),
          BlocBuilder<TextFieldWidgetCubit, TextFieldWidgetState>(
            bloc: textFieldWidgetCubit,
            builder: (context, state) {
              return TextFormField(
                obscureText: textFieldWidgetType == TextFieldWidgetType.password
                    ? textFieldWidgetCubit.isObscure
                    : false,
                controller: textEditingController,
                cursorColor: sl<AppColorConstants>().primary,
                style: Theme.of(context).textTheme.labelSmall,
                decoration: InputDecoration(
                  suffixIcon:
                      textFieldWidgetType == TextFieldWidgetType.password
                          ? state is TextFieldWidgetStateVisible
                              ? IconButton(
                                  icon: Icon(Icons.visibility_outlined),
                                  color: sl<AppColorConstants>().primary,
                                  onPressed: () => textFieldWidgetCubit
                                      .alternateIsVisibleValue(),
                                )
                              : IconButton(
                                  icon: Icon(Icons.visibility_off_outlined),
                                  color: sl<AppColorConstants>().primary,
                                  onPressed: () => textFieldWidgetCubit
                                      .alternateIsVisibleValue(),
                                )
                          : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints.tight(Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.06)),
                  filled: true,
                  fillColor: sl<AppColorConstants>().secondary,
                  border: border,
                  enabledBorder: border,
                  focusedBorder: activeBorder,
                  errorBorder: errorBorder,
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
