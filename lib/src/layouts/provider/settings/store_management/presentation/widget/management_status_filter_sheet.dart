import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_radio_tile.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:gap/gap.dart';

class ManagementStatusFilterSheet extends StatefulWidget {
  const ManagementStatusFilterSheet({
    super.key,
    required this.onStatusChanged,
    this.initialActive,
  });

  final ValueChanged<int?> onStatusChanged;
  final int? initialActive;

  static Future<void> show(
    BuildContext context, {
    required ValueChanged<int?> onStatusChanged,
    int? initialActive,
  }) async =>
      await showAppModalBottomSheet(
        context: context,
        child: ManagementStatusFilterSheet(
          onStatusChanged: onStatusChanged,
          initialActive: initialActive,
        ),
      );

  @override
  State<ManagementStatusFilterSheet> createState() =>
      _ManagementStatusFilterSheetState();
}

class _ManagementStatusFilterSheetState extends State<ManagementStatusFilterSheet> {
  int? groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.initialActive;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLocalizer.storeStatus, 
          style: TextStyles.bold14,
        ),
        const Gap(12),
        _buildRadioTile(null, appLocalizer.all),
        _buildRadioTile(1, appLocalizer.active), // Or active
        _buildRadioTile(0, appLocalizer.inactive), // Or inactive
        const Gap(24),
        AppButton(
          text: appLocalizer.search,
          onPressed: () {
            widget.onStatusChanged(groupValue);
            Navigator.pop(context);
          },
        ),
        const Gap(16),
      ],
    );
  }

  Widget _buildRadioTile(int? value, String title) {
    return AppRadioTile<int?>(
      value: value,
      groupValue: groupValue,
      onChanged: (val) {
        setState(() {
          groupValue = val;
        });
      },
      titleText: title,
      controlAffinity: ListTileControlAffinity.trailing,
      borderColor: Colors.transparent, // Background color is usually preferred
      selectedColor: AppColors.primary,
      unSelectedColor: AppColors.black,
      titleTextStyle: TextStyles.regular14,
      padding: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}
