import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/src/layouts/client/home/data/models/banner_model.dart';
import 'package:wasli/src/layouts/client/home/data/models/offer_model.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/client_home_banner_widget.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/custom_offer_card_widget.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/provider_categories_widget.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/widget/empty_state_widget.dart';
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
              const Gap(16),
              Expanded(
                child: Builder(builder: (context) {
                  return RefreshIndicator(
                    onRefresh: () => context.read<HomeCubit>().getHomeData(),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: BlocBuilder<HomeCubit, HomeState>(
                            buildWhen: (previous, current) =>
                                previous.bannersState != current.bannersState,
                            builder: (context, state) {
                              return HandleResponseWidget(
                                status: state.bannersState,
                                onRetry: () =>
                                    context.read<HomeCubit>().getBanners(),
                                loadingWidget: const Skeletonizer(
                                  child: ClientHomeBannerWidget(
                                    banners: [
                                      BannerModel.example(),
                                    ],
                                  ),
                                ),
                                onSuccess: (banners) {
                                  return ClientHomeBannerWidget(
                                      banners: banners ?? []);
                                },
                              );
                            },
                          ),
                        ),
                        const SliverGap(16),
                        SliverToBoxAdapter(
                          child: BlocBuilder<HomeCubit, HomeState>(
                            buildWhen: (previous, current) =>
                                previous.categoriesState !=
                                current.categoriesState,
                            builder: (context, state) {
                              return HandleResponseWidget(
                                status: state.categoriesState,
                                onRetry: () =>
                                    context.read<HomeCubit>().getCategories(),
                                loadingWidget: Skeletonizer(
                                  child: ProvidersCategoriesWidget(
                                    categories: [
                                      CategoryEntity.example(),
                                      CategoryEntity.example()
                                    ],
                                  ),
                                ),
                                onSuccess: (categories) {
                                  return ProvidersCategoriesWidget(
                                    categories: categories ?? [],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SliverGap(20),
                        SliverToBoxAdapter(
                          child: Row(
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
                        ),
                        const SliverGap(17),
                        BlocBuilder<HomeCubit, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.offersState != current.offersState,
                          builder: (context, state) {
                            return state.offersState.when(
                              loading: () => SliverToBoxAdapter(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) =>
                                      const Gap(16),
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Skeletonizer(
                                    child: const CustomOfferCardWidget(
                                      offer: OfferModel.example(),
                                    ).animateStaggered(index),
                                  ),
                                ),
                              ),
                              failure: (error) => SliverToBoxAdapter(
                                child: Text(error.message).center,
                              ),
                              success: (data) => SliverList.separated(
                                itemBuilder: (context, index) {
                                  return CustomOfferCardWidget(
                                    offer: data[index],
                                  ).animateStaggered(index);
                                },
                                separatorBuilder: (context, index) =>
                                    const Gap(16),
                                itemCount: data.length,
                              ),
                              successWithoutData: () {
                                return SliverToBoxAdapter(
                                  child: EmptyStateWidget(
                                    image: AppIllustrations.emptyOffers,
                                    text: appLocalizer.stayTunedOffersShort,
                                    subText:
                                        appLocalizer.stayTunedOffersFollowUs,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(100),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ],
          ).paddingAll(20).withSafeArea(),
        ));
  }
}
