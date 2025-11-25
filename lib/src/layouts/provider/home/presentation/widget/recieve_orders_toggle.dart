import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/home/presentation/dialog/stop_receive_orders_dialog.dart';

class ReceiveOrdersToggle extends StatefulWidget {
  const ReceiveOrdersToggle({
    super.key,
  });

  @override
  State<ReceiveOrdersToggle> createState() => _ReceiveOrdersToggleState();
}

class _ReceiveOrdersToggleState extends State<ReceiveOrdersToggle> {
  bool receiveOrders = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          appLocalizer.receive_orders,
          style: TextStyles.bold14,
        ),
        const Spacer(),
        Switch(
          value: receiveOrders,
          onChanged: (switchValue) {
            if (switchValue == true) {
              setState(() {
                receiveOrders = switchValue;
              });
              return;
            }
            StopReceiveOrdersDialog.showDialog(context, onChanged: (value) {
              if (value) {
                setState(() {
                  receiveOrders = switchValue;
                });
              }
            });
          },
          activeTrackColor: AppColors.primary,
          activeThumbColor: Colors.white,
          inactiveThumbColor: AppColors.greyColor,
          inactiveTrackColor: AppColors.disableindicatorColor,
          trackOutlineColor:
              WidgetStatePropertyAll(AppColors.disableBorderColor),
        )
      ],
    );
  }
}
