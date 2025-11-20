import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_theme.dart';
import '../../../../../core/core.dart';
import '../../../../../material/inputs/validator_field.dart';

class AcceptTermsAndConditionsWidget extends StatelessWidget {
  const AcceptTermsAndConditionsWidget({
    super.key,
    required this.isAccepted,
    required this.onChanged,
    this.canOpenTermsSheet = true,
  });
  final bool isAccepted;
  final void Function(bool value) onChanged;
  final bool canOpenTermsSheet;

  @override
  Widget build(BuildContext context) {
    return ValidatorField<bool>(
      validator: (value) {
        if (value == false) {
          return appLocalizer.youMustAgreeTermsAndConditionsFirst;
        }
        return null;
      },
      value: isAccepted,
      onSaved: (value) => onChanged(value ?? false),
      build:
          (context, hasError, errorMessage, value, onChange, onSave, validate) {
        void onValueChanged(bool value) {
          onChange(value);
          onSave();
        }

        return AnimatedSize(
          duration: Durations.medium3,
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            padding: hasError
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: hasError
                  ? getThemeColor(
                      lightColor: AppColors.red50,
                      darkColor: AppColors.canvasBackgroundColor,
                    )
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: FittedBox(
                        child: Checkbox(
                          value: isAccepted,
                          onChanged: (value) {
                            onValueChanged(value ?? false);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                            text: "${appLocalizer.agreeFor}\t",
                            style: TextStyles.regular12
                                .copyWith(color: AppColors.text2),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (canOpenTermsSheet == false) return;
                                    // StaticPageSheet.show(
                                    //   context,
                                    //   isAccepted: isAccepted,
                                    //   pageType:
                                    //       StaticPageTypeEnum.termsAndConditions,
                                    // ).then(
                                    //   (value) {
                                    //     if (value is bool) {
                                    //       onValueChanged(value);
                                    //     }
                                    //   },
                                    // );
                                  },
                                text: appLocalizer.termsAndConditions,
                                style: TextStyles.regular12.copyWith(
                                  color: AppColors.black,
                                  decorationColor: AppColors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ]),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                if (errorMessage?.isNotEmpty == true)
                  Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        errorMessage ?? '',
                        style:
                            Theme.of(context).inputDecorationTheme.errorStyle,
                      ))
              ],
            ),
          ),
        );
      },
    );
  }
}
