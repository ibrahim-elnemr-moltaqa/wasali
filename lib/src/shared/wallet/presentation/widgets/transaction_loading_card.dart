import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import '../../../../../material/shimmer/shimmer_effect_widget.dart';
import '../../../../../material/widgets/riyal_price_text.dart';

class TransactionLoadingCard extends StatelessWidget {
  const TransactionLoadingCard({
    super.key,
    this.bgColor,
    this.hasShadow = true,
  });
  final Color? bgColor;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor ?? AppColors.canvasBackgroundColor,
        boxShadow: hasShadow ? [AppColors.boxShadow2] : null,
      ),
      child: ShimmerWidget(
        child: Row(
          spacing: 12,
          children: [
            // AppSvgIcon(
            //   path: AppIcons.walletAddIc,
            //   color: AppColors.text,
            //   size: 20,
            // ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ])),
            RiyalPriceText(
              price: "00",
              priceTextStyle:
                  TextStyles.medium14.copyWith(color: AppColors.success800),
              textAlign: TextAlign.center,
              currencyTextStyle: TextStyles.medium14
                  .copyWith(color: AppColors.success800, height: 1.8),
            ),
          ],
        ),
      ),
    );
  }
}
