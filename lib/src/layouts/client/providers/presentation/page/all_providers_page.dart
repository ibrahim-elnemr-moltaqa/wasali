import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/custom_provider_card_widget.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/providers_appbar.dart';
import 'package:wasli/src/layouts/provider/authentication/data/enum/provider_enum.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class AllProvidersPage extends StatelessWidget {
  const AllProvidersPage({super.key, required this.providerType});
  final ProviderTypeEnum providerType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProvidersAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const Gap(20),
            AppTextFormField(
              prefixIcon: (isFouced) {
                return AppSvgIcon(
                  path: AppIcons.search,
                  color:
                      isFouced ? AppColors.primary : AppColors.textInputField,
                );
              },
              hintText: providerType.serchFieldHint,
            ),
            const Gap(16),
            SizedBox(
              height: 87,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(AppImages.resturants).circle(),
                        const Gap(4),
                        Text(providerType == ProviderTypeEnum.resturant
                            ? 'برجر'
                            : 'ألبان')
                      ],
                    );
                  }),
            ),
            const Gap(16),
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
                      .setBorder(radius: 24, padding: const EdgeInsets.all(12)),
                ),
                const Gap(12),
                Expanded(
                  child: Text(appLocalizer.closestMe,
                          style: TextStyles.bold12
                              .copyWith(color: AppColors.grey2Color))
                      .center
                      .setBorder(radius: 24, padding: const EdgeInsets.all(12)),
                )
              ],
            ),
            const Gap(16),
          ])),
          SliverList.separated(
              itemBuilder: (context, index) {
                return const CustomProviderCardWidget(
                  status: ProviderStatusEnum.closed,
                );
              },
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: 10)
        ],
      ).paddingHorizontal(20).withSafeArea(),
    );
  }
}
