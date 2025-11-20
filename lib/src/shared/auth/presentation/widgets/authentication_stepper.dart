import 'package:flutter/widgets.dart';
import '../../../../../core/core.dart';

const _kDefaultTotalSteps = 3;

class AuthenticationStepperWidget extends StatelessWidget {
  const AuthenticationStepperWidget({
    super.key,
    this.totolSteps = _kDefaultTotalSteps,
    required this.currentStep,
  });

  final int totolSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: Text.rich(TextSpan(
            text: appLocalizer.step,
            style: TextStyles.regular14.copyWith(color: AppColors.text2),
            children: [
              TextSpan(
                text: '\t$currentStep\t',
                style:
                    TextStyles.regular14.copyWith(color: AppColors.secondary),
              ),
              TextSpan(
                text: appLocalizer.from,
                style: TextStyles.regular14,
              ),
              TextSpan(
                text: '\t$totolSteps',
                style:
                    TextStyles.regular14.copyWith(color: AppColors.hintColor),
              ),
            ])),
      ),
    );
  }
}
