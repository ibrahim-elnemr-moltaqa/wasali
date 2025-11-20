import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import '../spin_kit_loading_widget.dart';

class AppButton extends StatelessWidget {
  final Color? buttonColor;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  const AppButton({
    super.key,
    this.isLoading = false,
    this.isEnabled = true,
    this.buttonColor,
    required this.text,
    this.textStyle,
    this.elevation = 0,
    this.onPressed,
    this.isExpanded = true,
    this.leading,
    this.trailing,
    this.padding,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = isEnabled == false;
    return ElevatedButton(
      statesController:
          isDisabled ? WidgetStatesController({WidgetState.disabled}) : null,
      onPressed: isDisabled
          ? null
          : isLoading
              ? null
              : onPressed,
      clipBehavior: Clip.antiAlias,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: buttonColor,
        backgroundBuilder: buttonColor != null
            ? (context, states, child) {
                return Container(
                  decoration: BoxDecoration(color: buttonColor),
                  child: child,
                );
              }
            : null,
        padding: buttonColor != null ? EdgeInsets.zero : padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
          ],
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: textStyle ??
                    TextStyles.bold14.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 6),
            (isLoading)
                ? const SpinKitLoadingWidget(color: Colors.white)
                : trailing!
          ] else ...[
            const SizedBox(width: 6),
            (isLoading)
                ? const SpinKitLoadingWidget(
                    color: Colors.white,
                  )
                : const SizedBox()
          ]
        ],
      ),
    );
  }
}
