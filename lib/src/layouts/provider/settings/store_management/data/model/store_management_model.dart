import 'package:flutter/widgets.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/size_management_tap.dart';

class StoreManagementTapModel {
  final String title;
  final String id;
  final Widget content;
  StoreManagementTapModel({
    required this.title,
    required this.id,
    required this.content,
  });

  static List<StoreManagementTapModel> loadStoreManagementTabs() {
    return [
      StoreManagementTapModel(
        title: appLocalizer.sizeManagement,
        id: 'products',
        content: const SizeManagementTap(),
      ),
      StoreManagementTapModel(
        title: appLocalizer.sectionsManagement,
        id: 'orders',
        content: const SizedBox(),
      ),
      StoreManagementTapModel(
        title: appLocalizer.productsManagement,
        id: 'categories',
        content: const SizedBox(),
      ),
    ];
  }
}
