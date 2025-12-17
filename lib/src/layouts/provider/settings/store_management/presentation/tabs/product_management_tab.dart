import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/size_item_widget.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_manage_product_item_widget.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_search_bar.dart';

class ProductManagementTab extends StatelessWidget {
  const ProductManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StoreManagementSearchBar(
          hintText: appLocalizer.product_name,
        ),
        const Gap(24),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return StoreMangeProductItemWidget(
                index: index,
              );
            },
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
