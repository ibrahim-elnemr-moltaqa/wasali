import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/product_item_widget.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/provider_categories_list.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/provider_header_details_section.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/providers_appbar.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProvidersAppBar(
        actions: [
          AppSvgIcon(
            path: AppIcons.shareIcSvg,
            color: AppColors.black,
            size: 18,
          ).setBorder(
            radius: 12,
            padding: const EdgeInsets.all(7),
          ),
          const Gap(8),
          AppSvgIcon(
            path: AppIcons.search,
            size: 18,
          )
              .setBorder(
                radius: 12,
                padding: const EdgeInsets.all(7),
              )
              .paddingEnd(12),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const ProviderHeaderDetailsSection(),
            const Gap(24),
            const ProviderCategoriesList(),
          ])),
          SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return const ProductItemWidget().animateStaggered(index);
              }),
        ],
      ).paddingHorizontal(20).withSafeArea(),
    );
  }
}
