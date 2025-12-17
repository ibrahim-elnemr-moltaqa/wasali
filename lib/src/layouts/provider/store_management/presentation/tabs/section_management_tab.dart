import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/store_management/presentation/widget/store_management_search_bar.dart';
import 'package:wasli/src/layouts/provider/store_management/presentation/widget/store_management_tab_item.dart';

class SectionManagementTab extends StatelessWidget {
  const SectionManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StoreManagementSearchBar(
          hintText: appLocalizer.section_name,
        ),
        const Gap(24),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return  StoreManagementTabItem(index: index,);
            },
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
