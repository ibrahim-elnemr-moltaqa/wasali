import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/core.dart';
import '../shimmer/gradiant_widget.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLength;
  final TextStyle? inputTextStyle;
  final Clip? clipBehavior;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final String? initialValue;
  final bool readOnly;
  final bool isTextSecured;
  final void Function()? onTap;
  final String? Function(String? text)? validate;
  final void Function(String text)? onChanged;
  final void Function(String text)? onFieldSubmitted;

  final String? label;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Widget Function(bool isFocused)? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final bool showCounter;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final Color? fillColor;

  final int? minLines;
  final int? maxLines;

  final AutovalidateMode? autovalidateMode;

  final double titlePadding;

  const AppTextFormField({
    super.key,
    this.controller,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.inputType,
    this.maxLength,
    this.inputTextStyle,
    this.clipBehavior = Clip.antiAlias,
    this.inputFormatters,
    this.textDirection,
    this.initialValue,
    this.readOnly = false,
    this.isTextSecured = false,
    this.onTap,
    this.validate,
    this.onChanged,
    this.onFieldSubmitted,
    this.contentPadding,
    this.showCounter = false,
    this.label,
    this.labelTextStyle,
    this.hintText,
    this.hintTextStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.filled,
    this.fillColor,
    this.minLines,
    this.maxLines,
    this.autovalidateMode,
    this.titlePadding = 6,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isTextSecured = false;
  final _focusNode = FocusNode();
  bool hasFocus = false;

  @override
  void initState() {
    isTextSecured = widget.isTextSecured;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus != hasFocus) {
        hasFocus = _focusNode.hasFocus;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = widget.labelTextStyle ??
        Theme.of(context).inputDecorationTheme.labelStyle;
    return Padding(
      padding: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label?.isNotEmpty == true)
            Padding(
              padding: EdgeInsets.only(bottom: widget.titlePadding),
              child: Text(
                widget.label ?? '',
                style: labelStyle,
              ),
            ),
          TextFormField(
            focusNode: _focusNode,
            cursorErrorColor: AppColors.red700,
            controller: widget.controller,
            keyboardType: widget.inputType,
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
            maxLength: widget.maxLength,
            style: widget.inputTextStyle ?? TextStyles.regular12,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            cursorColor: AppColors.primary,
            clipBehavior: widget.clipBehavior!,
            inputFormatters: widget.inputFormatters,
            textDirection: widget.textDirection,
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            obscureText: isTextSecured,
            onTap: widget.onTap,
            validator: widget.validate,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: widget.labelTextStyle,
              floatingLabelStyle: widget.labelTextStyle,
              hintText: widget.hintText,
              hintMaxLines: 10,
              errorMaxLines: 10,
              hintStyle: widget.hintTextStyle,
              counter: widget.showCounter ? null : const SizedBox.shrink(),
              enabledBorder: widget.enabledBorder,
              focusedBorder: widget.focusedBorder,
              disabledBorder: widget.disabledBorder,
              errorBorder: widget.errorBorder,
              focusedErrorBorder: widget.focusedErrorBorder,
              prefixIcon: _getPrefixWidget,
              prefixIconConstraints: widget.prefixIconConstraints,
              suffixIcon: widget.suffixIcon ?? _obsecureSuffix,
              filled: widget.filled,
              fillColor: widget.fillColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget? get _obsecureSuffix {
    if (widget.isTextSecured) {
      return InkWell(
        borderRadius: BorderRadius.circular(50),
        child: UnconstrainedBox(
          child: GradiantWidget(
            child: Icon(
              isTextSecured ? Icons.visibility_off : Icons.visibility,
              size: 18,
              weight: 50,
              opticalSize: 20,
              grade: -20,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isTextSecured = !isTextSecured;
          });
        },
      );
    }
    return null;
  }

  Widget? get _getPrefixWidget {
    if (widget.prefixIcon != null) {
      return UnconstrainedBox(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: widget.prefixIcon!(hasFocus),
        ),
      );
    }
    return null;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
