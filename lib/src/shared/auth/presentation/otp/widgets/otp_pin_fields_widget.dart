import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:wasli/core/core.dart';

const int appOtpFieldsLength = 4;
const Color _fieldColor = Colors.white;
final Color _focusedFieldColor = AppColors.primary50;
final Color _focusBorderColor = AppColors.primary500;
final Color _errorBorderColor = AppColors.error;
final Color _borderColor = AppColors.borderColor;

const double _focusBorderWidth = 1;
// const BoxShape _fieldShape = BoxShape.circle;
final _fieldRadius = BorderRadius.circular(16);

class OtpPinCodeWidget extends StatelessWidget {
  final bool hasError;
  final String? errorMessage;
  final bool readOnly;
  final TextEditingController controller;
  final void Function(String value)? onChange;
  final void Function(String value)? onCompleted;
  final String? Function(String? value)? validator;

  const OtpPinCodeWidget({
    super.key,
    required this.controller,
    this.hasError = false,
    this.errorMessage,
    this.readOnly = false,
    this.onChange,
    this.validator,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    const double fieldSize = 56;
    const double fieldHeight = 56;
    final textStyle = TextStyles.bold24.copyWith(
      color: AppColors.primary,
      height: 1,
      fontFamily: AppFonts.almaraia,
    );
    final errorTextStyle = Theme.of(context).inputDecorationTheme.errorStyle;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        readOnly: readOnly,
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        cursor: const SizedBox(),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        defaultPinTheme: PinTheme(
          width: fieldSize,
          height: fieldHeight,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: _fieldColor,

            borderRadius: _fieldRadius,
            // shape: _fieldShape,
            border: Border.all(
              color: _borderColor,
            ),
          ),
        ),
        submittedPinTheme: PinTheme(
          width: fieldSize,
          height: fieldHeight,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: _focusedFieldColor,
            // shape: _fieldShape,
            borderRadius: _fieldRadius,

            border: Border.all(
              color: _focusBorderColor,
            ),
          ),
        ),
        followingPinTheme: PinTheme(
          width: fieldSize,
          height: fieldHeight,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: _fieldColor,
            borderRadius: _fieldRadius,
            // shape: _fieldShape,
            border: Border.all(
              color: _borderColor,
            ),
          ),
        ),
        focusedPinTheme: PinTheme(
          width: fieldSize,
          height: fieldHeight,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: _fieldColor,
            borderRadius: _fieldRadius,

            // shape: _fieldShape,
            border: Border.all(
              width: _focusBorderWidth,
              color: _focusBorderColor,
            ),
          ),
        ),
        errorPinTheme: PinTheme(
          width: fieldSize,
          height: fieldHeight,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: _fieldColor,
            borderRadius: _fieldRadius,

            // shape: _fieldShape,
            border: Border.all(
              color: _errorBorderColor,
            ),
          ),
        ),
        disabledPinTheme: PinTheme(
          width: fieldSize,
          height: fieldHeight,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: _fieldColor,
            borderRadius: _fieldRadius,

            // shape: _fieldShape,
            border: Border.all(
              color: _borderColor,
            ),
          ),
        ),
        forceErrorState: hasError,
        errorTextStyle: errorTextStyle,
        onChanged: onChange,
        onCompleted: onCompleted,
        validator: validator,
        errorText: errorMessage,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
