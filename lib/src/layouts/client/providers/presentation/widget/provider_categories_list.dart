import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_category_model.dart';

class ProviderCategoriesList extends StatefulWidget {
  const ProviderCategoriesList({
    super.key,
  });

  @override
  State<ProviderCategoriesList> createState() => _ProviderCategoriesListState();
}

class _ProviderCategoriesListState extends State<ProviderCategoriesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSvgIcon(path: AppIcons.sort),
        const Gap(12),
        Expanded(
          child: SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = ProviderCategoryModel.categories[index];
                    return IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(item.name),
                              item.id == 0
                                  ? AppSvgIcon(path: AppIcons.fire)
                                  : const SizedBox.shrink()
                            ],
                          ).onTapScaleAnimation(onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                          if (item.id == currentIndex) ...{
                            const Gap(8),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? AppColors.primary
                                      : Colors.transparent),
                            )
                          }
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: ProviderCategoryModel.categories.length)),
        ),
      ],
    );
  }
}
