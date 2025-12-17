import 'package:flutter/cupertino.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/more/settings/widget/notification_switch.dart';

class ChangeStatusSwitch extends StatefulWidget {
  const ChangeStatusSwitch(
      {super.key, this.initialValue = false, this.onChange});
  final bool initialValue;
  final void Function(bool value)? onChange;

  @override
  State<ChangeStatusSwitch> createState() => _ChangeStatusSwitchState();
}

class _ChangeStatusSwitchState extends State<ChangeStatusSwitch>
    with WidgetsBindingObserver {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _valueNotifier.value = widget.initialValue;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _valueNotifier,
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  _valueNotifier.value
                      ? appLocalizer.active
                      : appLocalizer.inactive,
                  style: TextStyles.bold12),
              Directionality(
                textDirection: context.oppositeDirectionality,
                child: Transform.scale(
                  alignment: AlignmentDirectional.centerStart,
                  scale: 0.80,
                  child: CupertinoSwitch(
                    activeTrackColor: AppColors.primary,
                    value: _valueNotifier.value,
                    onChanged: (newVal) {
                      _valueNotifier.value = newVal;
                      widget.onChange?.call(newVal);
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }
}
