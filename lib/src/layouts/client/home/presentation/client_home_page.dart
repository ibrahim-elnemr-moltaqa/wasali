import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/client_home_banner_widget.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/custom_provider_card_widget.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/service_item_widget.dart';
import 'package:wasli/src/layouts/provider/register/data/enum/provider_enum.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/presentation/home/widget/home_app_bar.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HomeAppBar(title: appLocalizer.welcomeOnApp, role: RoleEnum.client),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const Gap(24),
                const ClientHomeBannerWidget(),
                const Gap(16),
                Row(
                  children: [
                    ServiceItemWidget(
                        title: appLocalizer.resturants,
                        image: AppImages.resturants,
                        onTap: () {
                          AppRouter.pushNamed(AppRoutes.allProvidersPage,
                              arguments: ProviderTypeEnum.resturant);
                        }),
                    const Gap(16),
                    ServiceItemWidget(
                        title: appLocalizer.supermarker,
                        image: AppImages.supermarket,
                        onTap: () {
                          AppRouter.pushNamed(AppRoutes.allProvidersPage,
                              arguments: ProviderTypeEnum.supermarker);
                        }),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    Text(
                      appLocalizer.featuredOffers,
                      style: TextStyles.bold14,
                    ),
                    const Spacer(),
                    Text(
                      appLocalizer.viewAll,
                      style: TextStyles.regular12
                          .copyWith(color: AppColors.grey2Color),
                    )
                  ],
                ),
                const Gap(17),
              ])),
              SliverList.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) =>
                      const CustomProviderCardWidget(),
                  itemCount: 10),
              const SliverToBoxAdapter(
                child: Gap(20),
              )
            ],
          ),
        ),
      ],
    ).paddingAll(20).withSafeArea());
  }
}
