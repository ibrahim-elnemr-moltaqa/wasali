import 'package:flutter/material.dart';
import '../../core/core.dart';
import 'app_text_form_field.dart';

class IdentityNumberField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String number)? onChanged;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const IdentityNumberField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelStyle,
    this.style,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      inputType: TextInputType.number,
      hintTextStyle: hintStyle,
      validate: (text) => Validator(text).commonIdentityNumber,
      onChanged: onChanged,
      label: appLocalizer.idNumber,
      hintText: appLocalizer.enterIdNumber,
      labelTextStyle: labelStyle,
      inputTextStyle: style,
      maxLines: 1,
      maxLength: 30,
      // prefixIcon: (isFocused) => AppSvgIcon(path: AppIcons.identityIc),
    );
  }
}
