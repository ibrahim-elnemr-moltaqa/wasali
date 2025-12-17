import 'package:flutter/widgets.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/tabs/product_management_tab.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/tabs/section_management_tab.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/tabs/size_management_tap.dart';

class StoreManagementTapModel {
  final String title;
  final String id;
  final Widget content;
  final String floatingActionButtonLabel;
  StoreManagementTapModel({
    required this.title,
    required this.id,
    required this.content,
    required this.floatingActionButtonLabel,
  });

  static List<StoreManagementTapModel> loadStoreManagementTabs() {
    final context = AppRouter.appContext;
    return [
      StoreManagementTapModel(
        title: appLocalizer.sizeManagement,
        id: 'sizeManagement',
        content: const SizeManagementTap(),
        floatingActionButtonLabel: appLocalizer.add_new_size,
      ),
      StoreManagementTapModel(
        title: appLocalizer.sectionsManagement,
        id: 'sectionsManagement',
        content: const SectionManagementTab(),
        floatingActionButtonLabel: appLocalizer.add_new_section,
      ),
      StoreManagementTapModel(
        title: appLocalizer.productsManagement,
        id: 'productsManagement',
        content: const ProductManagementTab(),
        floatingActionButtonLabel: appLocalizer.add_new_product,
      ),
    ];
  }
}
