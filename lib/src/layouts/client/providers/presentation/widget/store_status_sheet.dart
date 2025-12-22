import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_radio_tile.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';

class StoreStatusSheet extends StatefulWidget {
  const StoreStatusSheet({
    super.key,
    required this.onStatusChanged,
    this.currentStatus,
  });
  final ValueChanged<ProviderStatusEnum> onStatusChanged;
  final ProviderStatusEnum? currentStatus;

  static Future<void> show(
    BuildContext context, {
    required ValueChanged<ProviderStatusEnum> onStatusChanged,
    ProviderStatusEnum? currentStatus,
  }) async =>
      await showAppModalBottomSheet(
        context: context,
        child: StoreStatusSheet(
          onStatusChanged: onStatusChanged,
          currentStatus: currentStatus,
        ),
      );

  @override
  State<StoreStatusSheet> createState() => _StoreStatusSheetState();
}

class _StoreStatusSheetState extends State<StoreStatusSheet> {
  late ProviderStatusEnum groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.currentStatus ?? ProviderStatusEnum.all;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalizer.storeStatus,
          style: TextStyles.bold14,
        ),
        const SizedBox(height: 12),
        ...List.generate(ProviderStatusEnum.values.length, (index) {
          final status = ProviderStatusEnum.values[index];
          return AppRadioTile<ProviderStatusEnum>(
            value: status,
            groupValue: groupValue,
            onChanged: (value) {
              groupValue = value!;
              widget.onStatusChanged(value);
              setState(() {});
            },
            titleText: status.title,
            controlAffinity: ListTileControlAffinity.trailing,
            borderColor: AppColors.backgroundColor,
            selectedColor: AppColors.primary,
            unSelectedColor: AppColors.black,
            titleTextStyle: TextStyles.regular14,
          );
        })
      ],
    );
  }
}
