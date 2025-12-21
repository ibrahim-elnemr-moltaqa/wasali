import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';
import 'package:wasli/src/layouts/client/providers/presentation/cubit/providers_cubit.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/provider_card_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/provider_subcategories_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/providers_appbar.dart';
import 'package:wasli/src/layouts/provider/authentication/data/enum/provider_enum.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

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
      create: (context) => ProvidersCubit()..getSubCategories(args.categoryId),
      child: Scaffold(
        appBar: const ProvidersAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              const Gap(20),
              AppTextFormField(
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
              ProviderSubCategoriesWidget(args: args),
              Row(
                children: [
                  Expanded(
                    child: AppSingleDropDown<ProviderStatusEnum>(
                      items: ProviderStatusEnum.values,
                      value: null,
                      itemDisplay: (displayValue) => displayValue?.title,
                      hint: appLocalizer.storeStatus,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Text(appLocalizer.topRated,
                            style: TextStyles.bold12
                                .copyWith(color: AppColors.grey2Color))
                        .center
                        .setBorder(
                            radius: 24, padding: const EdgeInsets.all(12)),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Text(appLocalizer.closestMe,
                            style: TextStyles.bold12
                                .copyWith(color: AppColors.grey2Color))
                        .center
                        .setBorder(
                            radius: 24, padding: const EdgeInsets.all(12)),
                  )
                ],
              ),
              const Gap(16),
            ])),
            SliverList.separated(
                itemBuilder: (context, index) {
                  return const ProviderCardWidget(
                    status: ProviderStatusEnum.opened,
                  ).animateStaggered(index);
                },
                separatorBuilder: (context, index) => const Gap(16),
                itemCount: 10)
          ],
        ).paddingHorizontal(20).withSafeArea(),
      ),
    );
  }
}
