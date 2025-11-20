import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart' show AppColors, TextStyles;
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/auth/domain/entities/auth_step_entity.dart';

class CustomAuthStepperWidget extends StatefulWidget {
  const CustomAuthStepperWidget({
    super.key,
    required this.steps,
    required this.completedSteps,
    this.initialStep = 0,
    this.onStepChanged,
  });

  final List<AuthStepEntity> steps;

  final Set<int> completedSteps;

  final int initialStep;
  final ValueChanged<int>? onStepChanged;

  @override
  State<CustomAuthStepperWidget> createState() =>
      _CustomAuthStepperWidgetState();
}

class _CustomAuthStepperWidgetState extends State<CustomAuthStepperWidget> {
  late int currentStep;

  @override
  void initState() {
    super.initState();
    currentStep = widget.initialStep;
  }

  void goToStep(int index) {
    setState(() {
      currentStep = index;
    });

    if (widget.onStepChanged != null) {
      widget.onStepChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.steps.length, (index) {
        final isActive = index == currentStep;
        final isCompleted = widget.completedSteps.contains(index);

        return Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => goToStep(index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isActive || isCompleted
                          ? AppColors.primary
                          : AppColors.disableindicatorColor,
                      shape: BoxShape.circle,
                    ),
                    child: AppSvgIcon(
                      path: widget.steps[index].icon,
                      height: 12,
                      color: isActive ? AppColors.secondary : null,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.steps[index].title,
                      style: TextStyles.regular12,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
