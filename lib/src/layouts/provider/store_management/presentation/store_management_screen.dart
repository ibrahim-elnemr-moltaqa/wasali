import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/provider/authentication/data/model/store_management_model.dart';
import 'package:wasli/src/layouts/provider/store_management/presentation/widget/store_management_floating_action_button.dart';

class StoreManagementPage extends StatefulWidget {
  const StoreManagementPage({super.key});

  @override
  State<StoreManagementPage> createState() => _StoreManagementPageState();
}

class _StoreManagementPageState extends State<StoreManagementPage>
    with SingleTickerProviderStateMixin {
  late final List<StoreManagementTapModel> tabs;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabs = StoreManagementTapModel.loadStoreManagementTabs();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          dividerColor: AppColors.dividerColor,
          controller: tabController,
          labelColor: AppColors.black,
          unselectedLabelColor: AppColors.grey2Color,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabs
              .map((tab) => Tab(
                    text: tab.title,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((e) => e.content).toList(),
      ).paddingHorizontal(20).withSafeArea(),
      floatingActionButton: AnimatedBuilder(
        animation: tabController,
        builder: (context, child) {
          return StoreManagementFloatingActionButton(
            label: tabs[tabController.index].floatingActionButtonLabel,
            onTap: tabs[tabController.index].onFloatingActionButtonPressed,
          );
        },
      ),
    );
  }
}
