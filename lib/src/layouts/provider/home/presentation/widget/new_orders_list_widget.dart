import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/src/layouts/provider/home/presentation/widget/provider_order_card_widget.dart';

class NewOrdersListWidget extends StatelessWidget {
  const NewOrdersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            appLocalizer.new_orders,
            style: TextStyles.bold14,
          ),
          const Gap(12),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) => const Gap(12),
            itemBuilder: (context, index) {
              return const ProviderOrderCardWidget()
                  .animateStaggered(index, milliseconds: 300);
            },
            itemCount: 10,
          ))
        ],
      ),
    );
  }
}
