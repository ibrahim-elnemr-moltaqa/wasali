import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/change_status_switch.dart';

class MoreStoreManagementBottomSheet extends StatefulWidget {
  const MoreStoreManagementBottomSheet._(
      this.initialSwitchValue, this.onSwitchChange, this.onDeleteTap);
  final int? initialSwitchValue;
  final void Function(bool)? onSwitchChange;
  final void Function()? onDeleteTap;

  static void showModalBottomSheet(BuildContext context,
          {int? initialSwitchValue,
          void Function(bool)? onSwitchChange,
          void Function()? onDeleteTap}) async =>
      await showAppModalBottomSheet(
          context: context,
          child: MoreStoreManagementBottomSheet._(
            initialSwitchValue,
            onSwitchChange,
            onDeleteTap,
          ));

  @override
  State<MoreStoreManagementBottomSheet> createState() =>
      _MoreStoreManagementBottomSheetState();
}

class _MoreStoreManagementBottomSheetState
    extends State<MoreStoreManagementBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChangeStatusSwitch(
          initialValue: widget.initialSwitchValue == 1 ? true : false,
          onChange: widget.onSwitchChange,
        ),
        const Divider(),
        Visibility(
          visible: widget.onDeleteTap != null,
          child: Text(
            appLocalizer.delete,
            style: TextStyles.bold14.copyWith(color: AppColors.red600),
          ).onTapScaleAnimation(onTap: widget.onDeleteTap ?? () {}),
        )
      ],
    );
  }
}
