import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/overlay/show_dialog.dart';

class StopReceiveOrdersDialog extends StatefulWidget {
  const StopReceiveOrdersDialog._(this.onChanged);
  final ValueChanged<bool> onChanged;

  static void showDialog(BuildContext context,
      {ValueChanged<bool>? onChanged}) async {
    return await showAppDialog(
        context: context,
        child: StopReceiveOrdersDialog._(onChanged ?? (_) {}));
  }

  @override
  State<StopReceiveOrdersDialog> createState() =>
      _StopReceiveOrdersDialogState();
}

class _StopReceiveOrdersDialogState extends State<StopReceiveOrdersDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLocalizer.stop_receiving_today_question,
          style: TextStyles.bold14,
        ),
        const Gap(8),
        Text(
          appLocalizer.stop_receiving_today_description,
          style: TextStyles.regular12,
        ),
        const Gap(24),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: appLocalizer.confirm,
                onPressed: () {
                  widget.onChanged(true);
                  Navigator.pop(context);
                },
              ),
            ),
            const Gap(8),
            Expanded(
              child: AppButton(
                text: appLocalizer.close,
                buttonColor: AppColors.lightGreyColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
