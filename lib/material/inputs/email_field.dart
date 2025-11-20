import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/core.dart';
import 'app_text_form_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String email)? onChanged;
  final bool isOptional;
  final TextStyle? labelStyle;
  final String? hint;
  final String? labelText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;

  const EmailField({
    super.key,
    required this.controller,
    this.onChanged,
    this.isOptional = false,
    this.labelStyle,
    this.hint,
    this.labelText,
    this.style,
    this.hintStyle,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      inputType: TextInputType.emailAddress,
      hintTextStyle: hintStyle,
      validate: (text) => Validator(text).email(isOptional: isOptional),
      onChanged: onChanged,
      label: labelText ?? appLocalizer.emailAddress,
      hintText: hint ?? appLocalizer.enterEmailAddress,
      labelTextStyle: labelStyle,
      inputTextStyle: style,
      inputFormatters: [
        FilteringTextInputFormatter.deny(" "),
        AlwaysLowerCaseInputFormatter()
      ],
      filled: true,
      fillColor: AppColors.canvasBackgroundColor,
      // prefixIcon: (isFocused) => AppSvgIcon(path: AppIcons.emailIc),
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [if (suffixIcon != null) suffixIcon!],
        ),
      ),
    );
  }
}
