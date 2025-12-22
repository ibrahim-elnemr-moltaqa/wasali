import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/service_item_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/page/all_providers_page.dart';
import 'package:wasli/src/layouts/provider/authentication/data/enum/provider_enum.dart';

class ProvidersCategoriesWidget extends StatelessWidget {
  const ProvidersCategoriesWidget({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (categories.isNotEmpty)
          ServiceItemWidget(
              title: categories[0].name,
              image: AppImages.resturants,
              onTap: () {
                AppRouter.pushNamed(AppRoutes.allProvidersPage,
                    arguments: AllProvidersPageArgs(
                        providerType: ProviderTypeEnum.restaurant,
                        categoryId: categories[0].id));
              }),
        const Gap(16),
        if (categories.length > 1)
          ServiceItemWidget(
              title: categories[1].name,
              image: AppImages.supermarket,
              onTap: () {
                AppRouter.pushNamed(AppRoutes.allProvidersPage,
                    arguments: AllProvidersPageArgs(
                        providerType: ProviderTypeEnum.supermarket,
                        categoryId: categories[1].id));
              }),
      ],
    );
  }
}
