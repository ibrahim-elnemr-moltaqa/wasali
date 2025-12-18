import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/package_tile.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class PayPackageBottomSheet extends StatelessWidget {
  const PayPackageBottomSheet._();

  static Future<void> show(BuildContext context) async =>
      await showAppModalBottomSheet(
        context: context,
        child: const PayPackageBottomSheet._(),
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          appLocalizer.payPackageData,
          style: TextStyles.bold14,
        ),
        const Gap(24),
        PackageTile(
            label: appLocalizer.packagePrice, customValue: const PriceWidget()),
        const Gap(8),
        PackageTile(
            label: appLocalizer.appCommission,
            customValue: const PriceWidget()),
        const Gap(8),
        PackageTile(
            label: appLocalizer.total,
            labelStyle: TextStyles.regular14,
            customValue: const PriceWidget()),
        const Gap(44),
        AppButton(
          text: appLocalizer.pay,
          onPressed: () {},
        ),
      ],
    );
  }
}
