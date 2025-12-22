import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/add_new_product_page.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/products/products_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_manage_product_item_widget.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_floating_action_button.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_search_bar.dart';

class ProductManagementTab extends StatelessWidget {
  const ProductManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        buildWhen: (previous, current) =>
            previous.productsState != current.productsState,
        builder: (context, state) {
          return HandleResponseWidget(
            status: state.productsState,
            onRetry: () => context.read<ProductsCubit>().getProducts(),
            successWithoutDataBuilder: () {
              return AppImage(path: AppImages.emptyState);
            },
            onSuccess: (data) {
              final products = data as List<ProductEntity>;
              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Column(
                    children: [
                      StoreManagementSearchBar(
                        hintText: appLocalizer.product_name,
                        onChanged: (query) {
                          context.read<ProductsCubit>().getProducts();
                        },
                      ),
                      const Gap(24),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return StoreMangeProductItemWidget(
                              index: index,
                              product: products[index],
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(16),
                          itemCount: products.length,
                        ),
                      )
                    ],
                  ),
                  StoreManagementFloatingActionButton(
                    label: appLocalizer.add_new_product,
                    onTap: () async {
                      final result = await AppRouter.push(
                        const AddNewProductPage(),
                      );
                      if (result != null && context.mounted) {
                        context.read<ProductsCubit>().getProducts();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
