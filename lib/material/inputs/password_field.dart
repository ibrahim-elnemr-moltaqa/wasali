import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../media/svg_icon.dart';
import 'app_text_form_field.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String? text)? validator;
  final Widget? suffix;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final bool readOnly;
  final String iconPath;

  const PasswordField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.suffix,
    this.style,
    this.labelStyle,
    this.readOnly = false,
    this.iconPath = "assets/icons/key_ic.svg",
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      inputType: TextInputType.visiblePassword,
      isTextSecured: true,
      readOnly: readOnly,
      maxLength: 30,
      inputTextStyle: style,
      suffixIcon: suffix == null
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [if (suffix != null) suffix!],
              ),
            ),
      labelTextStyle: labelStyle,
      prefixIcon: (isFocused) => AppSvgIcon(
        path: iconPath,
        color: AppColors.hintColor,
      ),
      validate: (text) {
        if (validator != null) {
          return validator!(text);
        }
        return Validator(text).password;
      },
      label: labelText ?? appLocalizer.password,
      hintText: hintText ?? "************",
    );
  }
}
