import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/store_management_model.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/manage_store_tab_bar_widget.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_floating_action_button.dart';

class StoreManagementScreen extends StatefulWidget {
  const StoreManagementScreen({super.key});

  @override
  State<StoreManagementScreen> createState() => _StoreManagementScreenState();
}

class _StoreManagementScreenState extends State<StoreManagementScreen> {
  ValueNotifier<StoreManagementTapModel> selectedTab =
      ValueNotifier<StoreManagementTapModel>(
          StoreManagementTapModel.loadStoreManagementTabs().first);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appLocalizer.manage_store),
          centerTitle: false,
          leading: const BackButton()
              .setBorder(
                radius: 12,
              )
              .paddingAll(8),
        ),
        body: Column(
          children: [
            const Gap(42),
            ValueListenableBuilder(
                valueListenable: selectedTab,
                builder: (context, value, child) {
                  return ManageStoreTapBarWidget(
                    onTabChanged: (selectedTap) {
                      selectedTab.value = selectedTap;
                    },
                  );
                }),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: selectedTab,
                  builder: (context, value, child) {
                    return selectedTab.value.content;
                  }),
            )
          ],
        ).paddingHorizontal(20).withSafeArea(),
        floatingActionButton: const StoreManagementFloatingActionButton());
  }
}
