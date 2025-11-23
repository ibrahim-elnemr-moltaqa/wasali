import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/core.dart';

class NameField extends StatelessWidget {
  final void Function(String name)? onChanged;
  final void Function(String name)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final String? label;
  final String? hint;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Color? fillColor;
  final bool showPrefixIcon;
  final Widget? prefix;
  final bool isFloatingLabel;
  final bool isOptional;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final String? underLine;
  final bool showCounter;

  const NameField({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.validator,
    this.label,
    this.hint,
    this.labelStyle,
    this.style,
    this.fillColor,
    this.showPrefixIcon = true,
    this.prefix,
    this.isFloatingLabel = false,
    this.isOptional = false,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.underLine,
    this.showCounter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              label ?? '',
              style: labelStyle,
            ),
          ),
        TextFormField(
          controller: controller,
          maxLength: 50,
          readOnly: readOnly,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ??
              (name) => Validator(name).name(isOptional: isOptional),
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              Transform.translate(
            offset: const Offset(-5, -35),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withAlpha(230),
              ),
              child: Text(
                '$currentLength / $maxLength',
                textDirection: TextDirection.ltr,
                style: TextStyles.regular12.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ),
          decoration: InputDecoration(
              hintText: hint ?? appLocalizer.name,
              counter: showCounter ? null : const SizedBox.shrink()),
          keyboardType: TextInputType.name,
          // inputTextStyle: style,
          // fillColor: fillColor,
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
            CapitalizeFirstInputFormatter(),
            FilteringTextInputFormatter.deny("*"),
            FilteringTextInputFormatter.deny("\t\t"),
            FilteringTextInputFormatter.deny("-"),
            FilteringTextInputFormatter.deny("/"),
            FilteringTextInputFormatter.deny("?"),
            FilteringTextInputFormatter.deny("&"),
            FilteringTextInputFormatter.deny("%"),
            FilteringTextInputFormatter.deny("\$"),
            FilteringTextInputFormatter.deny("@"),
            FilteringTextInputFormatter.deny("!"),
            FilteringTextInputFormatter.deny("+"),
            FilteringTextInputFormatter.deny("|"),
            FilteringTextInputFormatter.deny("<"),
            FilteringTextInputFormatter.deny(">"),
            FilteringTextInputFormatter.deny("{"),
            FilteringTextInputFormatter.deny("}"),
            FilteringTextInputFormatter.deny("["),
            FilteringTextInputFormatter.deny("]"),
            FilteringTextInputFormatter.deny("."),
            FilteringTextInputFormatter.deny("~"),
            FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
          ],
          // prefixIcon: (isFocused) =>
          //     AppSvgIcon(path: prefixIcon ?? AppIcons.userIc),
        ),
        if (underLine != null) ...[
          const SizedBox(height: 4),
          Text(
            underLine!,
            style: TextStyles.light10.copyWith(color: AppColors.secondary300),
          ),
        ]
      ],
    );
  }
}
