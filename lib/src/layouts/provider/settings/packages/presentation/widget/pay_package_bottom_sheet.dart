import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/package_tile.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class PayPackageBottomSheet extends StatelessWidget {
  const PayPackageBottomSheet._(this.package, this.onTapPay);
  final PackageEntity? package;
  final void Function()? onTapPay;

  static Future<void> show(BuildContext context,
          {PackageEntity? package, void Function()? onTapPay}) async =>
      await showAppModalBottomSheet(
        context: context,
        child: PayPackageBottomSheet._(
          package,
          onTapPay,
        ),
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
            label: appLocalizer.packagePrice,
            customValue: PriceWidget(
              price: package?.price.toString(),
            )),
        const Gap(8),
        PackageTile(
            label: appLocalizer.appCommission,
            customValue: const PriceWidget(
              price: '10',
            )),
        const Gap(8),
        PackageTile(
            label: appLocalizer.total,
            labelStyle: TextStyles.regular14,
            customValue: PriceWidget(
              price: package?.price != null
                  ? (package!.price + 10).toString()
                  : 'N/A',
            )),
        const Gap(44),
        AppButton(
          text: appLocalizer.pay,
          onPressed: onTapPay,
        ),
      ],
    );
  }
}
