import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';

class IbanField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String number)? onChanged;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const IbanField({
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
      inputType: TextInputType.text,
      hintTextStyle: hintStyle,
      // validate: (text) => Validator(text).ibanValidator,
      onChanged: onChanged,
      label: appLocalizer.ibaneNumber,
      hintText: appLocalizer.enterIbaneNumber,
      labelTextStyle: labelStyle,
      inputTextStyle: style,
      maxLines: 1,
      maxLength: 34,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
