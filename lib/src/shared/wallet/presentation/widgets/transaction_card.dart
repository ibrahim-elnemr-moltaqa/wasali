import 'package:flutter/widgets.dart';
import 'package:wasli/core/core.dart';
import '../../../../../material/media/svg_icon.dart';
import '../../../../../material/widgets/riyal_price_text.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.getDateFormatted,
    this.bgColor,
    this.hasShadow = true,
  });

  final Color? bgColor;
  final TransactionEntity transaction;
  final bool hasShadow;
  final String Function(DateTime date) getDateFormatted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor ?? AppColors.canvasBackgroundColor,
        boxShadow: hasShadow ? [AppColors.boxShadow2] : null,
      ),
      child: Row(
        spacing: 12,
        children: [
          AppSvgIcon(
            path: transaction.type.icon,
            color: AppColors.text,
            size: 20,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                Text(
                  transaction.name,
                  style: TextStyles.regular12.copyWith(color: AppColors.text),
                ),
                Text(
                  getDateFormatted(transaction.date),
                  style: TextStyles.regular12.copyWith(color: AppColors.text1),
                ),
              ])),
          RiyalPriceText(
            price: transaction.amount.toString(),
            priceTextStyle:
                TextStyles.medium14.copyWith(color: transaction.type.color),
            textAlign: TextAlign.center,
            currencyTextStyle: TextStyles.medium14
                .copyWith(color: transaction.type.color, height: 1.8),
          ),
        ],
      ),
    );
  }
}
