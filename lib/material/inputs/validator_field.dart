import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../media/svg_icon.dart';

class ValidatorField<T> extends FormField<T?> {
  final T? value;
  final Widget Function(
    BuildContext context,
    bool hasError,
    String? errorMessage,
    T? value,
    void Function(T? value) onChange,
    VoidCallback onSave,
    VoidCallback validate,
  ) build;

  ValidatorField(
      {super.key,
      this.value,
      required this.build,
      super.validator,
      super.onSaved})
      : super(
          initialValue: value,
          builder: (field) {
            final value = field.value;
            final bool hasError = field.hasError;
            return build(
              field.context,
              hasError,
              field.errorText,
              value,
              field.didChange,
              field.save,
              field.validate,
            );
          },
        );
}

class DefaultInputFieldDesign extends StatelessWidget {
  const DefaultInputFieldDesign({
    super.key,
     this.title,
    required this.hint,
    required this.hasError,
    required this.errorMessage,
    required this.onTap,
    this.value,
    this.prefixIconPath,
    this.titleStyle,
    this.suffixIconPath,
    this.hintStyle,
    this.inputStyle,
    this.heroTag,
    this.suffixIcon,
    this.borderRadius,
  });
  final double? borderRadius;
  final String? title;
  final String hint;
  final bool hasError;
  final String errorMessage;
  final VoidCallback onTap;
  final String? value;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Widget? suffixIcon;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final defaultInputDecoration = Theme.of(context).inputDecorationTheme;
    final lableStyle =
        titleStyle ?? defaultInputDecoration.labelStyle ?? TextStyles.regular16;
    final hintStyle = this.hintStyle ?? defaultInputDecoration.hintStyle;
    final inputStyle = this.inputStyle ??
        TextStyles.regular12.copyWith(
          color: AppColors.text,
        );
    final defaultBorderColor =
        defaultInputDecoration.border?.borderSide.color ??
            AppColors.borderColor;
    final errorBorderColor =
        defaultInputDecoration.focusedErrorBorder?.borderSide.color ??
            AppColors.red700;
    final borderColor = hasError ? errorBorderColor : defaultBorderColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedSize(
          clipBehavior: Clip.antiAlias,
          duration: Durations.medium4,
          reverseDuration: Durations.medium4,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title?.isNotEmpty==true)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text('$title', style: lableStyle),
                ),
              Builder(builder: (context) {
                final Widget child = GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onTap,
                  child: AnimatedContainer(
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    duration: Durations.medium4,
                    constraints:
                        Theme.of(context).inputDecorationTheme.constraints,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius ?? 32),
                      border: Border.all(color: borderColor),
                      color: AppColors.canvasBackgroundColor,
                    ),
                    padding:
                        Theme.of(context).inputDecorationTheme.contentPadding,
                    child: Row(
                      children: [
                        if (prefixIconPath != null)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 6),
                            child: AppSvgIcon(path: prefixIconPath ?? ''),
                          ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            child: value?.isNotEmpty == true
                                ? Text(
                                    value ?? '',
                                    maxLines: 1,
                                    style: inputStyle,
                                  )
                                : Text(
                                    hint,
                                    maxLines: 1,
                                    style: hintStyle,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        if (suffixIcon != null) suffixIcon!,
                        if (suffixIconPath?.isNotEmpty == true)
                          AppSvgIcon(
                            path: suffixIconPath ?? '',
                            // color: AppColors.text,
                          ),
                        if (suffixIconPath?.isNotEmpty == false &&
                            suffixIcon == null)
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: AppColors.text,
                          ),
                      ],
                    ),
                  ),
                );
                if (heroTag != null) {
                  return Hero(
                    tag: heroTag!,
                    child: Material(color: Colors.transparent, child: child),
                  );
                } else {
                  return child;
                }
              }),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, top: 4),
                  child: Text(
                    errorMessage,
                    style: Theme.of(context).inputDecorationTheme.errorStyle,
                  ),
                ),
            ],
          )),
    );
  }
}
