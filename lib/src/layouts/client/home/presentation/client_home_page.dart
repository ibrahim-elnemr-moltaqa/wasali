import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/src/layouts/client/home/domain/entities/home_data.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/client_home_banner_widget.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/custom_offer_card_widget.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/service_item_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/page/all_providers_page.dart';
import 'package:wasli/src/layouts/provider/authentication/data/enum/provider_enum.dart';
import 'package:wasli/src/shared/common/presentation/widget/home_app_bar.dart';

import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getHomeData(),
        child: Scaffold(
          body: Column(
            children: [
              const HomeAppBar(),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return HandleResponseWidget(
                      status: state.homeDataState,
                      onRetry: () => context.read<HomeCubit>().getHomeData(),
                      onSuccess: (data) {
                        final HomeData homeData = data ?? HomeData.initial();
                        return RefreshIndicator(
                          onRefresh: () =>
                              context.read<HomeCubit>().getHomeData(),
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                  delegate: SliverChildListDelegate([
                                const Gap(24),
                                ClientHomeBannerWidget(
                                    banners: homeData.banners),
                                const Gap(16),
                                Row(
                                  children: [
                                    ServiceItemWidget(
                                        title: homeData.categories[1].name,
                                        image: AppImages.restaurant,
                                        onTap: () {
                                          AppRouter.pushNamed(
                                              AppRoutes.allProvidersPage,
                                              arguments: AllProvidersPageArgs(
                                                  providerType: ProviderTypeEnum
                                                      .restaurant,
                                                  categoryId: homeData
                                                      .categories[1].id));
                                        }),
                                    const Gap(16),
                                    ServiceItemWidget(
                                        title: homeData.categories[2].name,
                                        image: AppImages.supermarket,
                                        onTap: () {
                                          AppRouter.pushNamed(
                                              AppRoutes.allProvidersPage,
                                              arguments: AllProvidersPageArgs(
                                                  providerType: ProviderTypeEnum
                                                      .supermarket,
                                                  categoryId: homeData
                                                      .categories[2].id));
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
                                      style: TextStyles.regular12.copyWith(
                                          color: AppColors.grey2Color),
                                    )
                                  ],
                                ),
                                const Gap(17),
                              ])),
                              SliverList.separated(
                                  separatorBuilder: (context, index) =>
                                      const Gap(16),
                                  itemBuilder: (context, index) =>
                                      CustomOfferCardWidget(
                                        offer: homeData.offers[index],
                                      ).animateStaggered(index),
                                  itemCount: homeData.offers.length),
                              const SliverToBoxAdapter(
                                child: Gap(100),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ).paddingAll(20).withSafeArea(),
        ));
  }
}
