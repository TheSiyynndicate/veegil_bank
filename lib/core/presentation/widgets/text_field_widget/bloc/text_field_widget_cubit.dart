import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_field_widget_state.dart';

class TextFieldWidgetCubit extends Cubit<TextFieldWidgetState> {
  TextFieldWidgetCubit() : super(TextFieldWidgetStateObsecure());

  bool _isObscure = true;


  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
  }

  void alternateIsVisibleValue() {
    isObscure = !isObscure;

    if (isObscure) {
      emit(TextFieldWidgetStateObsecure());
    } else {
      emit(TextFieldWidgetStateVisible());

    }
  }
}
