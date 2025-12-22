import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_debounce_search_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';
import 'package:wasli/src/layouts/client/providers/presentation/cubit/providers_cubit.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/all_providers_filter_taps.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/provider_card_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/provider_subcategories_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/providers_appbar.dart';
import 'package:wasli/src/layouts/provider/authentication/data/enum/provider_enum.dart';
import 'package:wasli/src/shared/common/presentation/widget/empty_state_widget.dart';

class AllProvidersPageArgs {
  final ProviderTypeEnum providerType;
  final int categoryId;
  const AllProvidersPageArgs(
      {required this.providerType, required this.categoryId});
}

class AllProvidersPage extends StatelessWidget {
  const AllProvidersPage({super.key, required this.args});
  final AllProvidersPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProvidersCubit()..init(args.categoryId),
      child: Scaffold(
        appBar: const ProvidersAppBar(),
        body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const Gap(20),
                AppDebounceSearchField(
                  onChanged: (value) {
                    context.read<ProvidersCubit>().updateSearchQuery(value);
                  },
                  prefixIcon: (isFocused) {
                    return AppSvgIcon(
                      path: AppIcons.search,
                      color: isFocused
                          ? AppColors.primary
                          : AppColors.textInputField,
                    );
                  },
                  hintText: args.providerType.searchFieldHint,
                ),
                const Gap(16),
                ProviderSubCategoriesWidget(
                  args: args,
                  onSubCategorySelected: (value) {
                    context.read<ProvidersCubit>().updateCategory(value);
                  },
                ),
                const AllProvidersFilterTaps(),
                const Gap(16),
              ])),
              BlocBuilder<ProvidersCubit, ProvidersState>(
                builder: (context, state) {
                  return state.providersState.when(
                    loading: () => SliverToBoxAdapter(
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Gap(16),
                        itemCount: 5,
                        itemBuilder: (context, index) => Skeletonizer(
                          child: const ProviderCardWidget(
                            provider: ProviderModel.example(),
                          ).animateStaggered(index),
                        ),
                      ),
                    ),
                    failure: (error) => SliverToBoxAdapter(
                      child: Text(error.message).center,
                    ),
                    success: (data) => SliverList.separated(
                      itemBuilder: (context, index) {
                        return ProviderCardWidget(
                          provider: data[index],
                        ).animateStaggered(index);
                      },
                      separatorBuilder: (context, index) => const Gap(16),
                      itemCount: data.length,
                    ),
                    successWithoutData: () {
                      return SliverToBoxAdapter(
                        child: EmptyStateWidget(
                          image: AppIllustrations.emptyProviders,
                          text: appLocalizer.noVendorsInThisCategory,
                          subText:
                              appLocalizer.noVendorsInThisCategoryWorkingOnMore,
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ).paddingHorizontal(20).withSafeArea();
        }),
      ),
    );
  }
}
