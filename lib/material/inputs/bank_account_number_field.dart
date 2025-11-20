import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';

class BankAccountNumberField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String number)? onChanged;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const BankAccountNumberField({
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
      validate: (text) => Validator(text).bankAccountValidator,
      onChanged: onChanged,
      label: appLocalizer.bankAccountNumber,
      hintText: appLocalizer.enterBankAccountNumber,
      labelTextStyle: labelStyle,
      inputTextStyle: style,
      maxLines: 1,
      maxLength: 24,
    );
  }
}
