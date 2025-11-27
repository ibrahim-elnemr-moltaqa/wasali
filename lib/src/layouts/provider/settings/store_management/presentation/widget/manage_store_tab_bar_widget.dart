import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/store_management_model.dart';

class ManageStoreTapBarWidget extends StatefulWidget {
  const ManageStoreTapBarWidget({
    super.key,
    required this.onTabChanged,
  });

  final ValueChanged<StoreManagementTapModel> onTabChanged;

  @override
  State<ManageStoreTapBarWidget> createState() =>
      _ManageStoreTapBarWidgetState();
}

class _ManageStoreTapBarWidgetState extends State<ManageStoreTapBarWidget> {
  StoreManagementTapModel selectedTab =
      StoreManagementTapModel.loadStoreManagementTabs().first;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Divider(color: AppColors.borderColor, thickness: 1).paddingBottom(16),
        Positioned(
          top: -25,
          right: 0,
          left: 0,
          bottom: 0,
          child: Row(
            children: List.generate(
                StoreManagementTapModel.loadStoreManagementTabs().length,
                (index) {
              return Expanded(
                  child: IntrinsicWidth(
                child: Column(
                  children: [
                    Text(
                      StoreManagementTapModel.loadStoreManagementTabs()[index]
                          .title,
                      style: selectedTab ==
                              StoreManagementTapModel.loadStoreManagementTabs()[
                                  index]
                          ? TextStyles.bold14
                          : TextStyles.regular14,
                    ),
                    if (selectedTab ==
                        StoreManagementTapModel.loadStoreManagementTabs()[
                            index]) ...{
                      const Gap(4),
                      Divider(
                        color: AppColors.primary,
                        thickness: 2,
                      ),
                    }
                  ],
                ).onTapScaleAnimation(onTap: () {
                  setState(() {
                    selectedTab = StoreManagementTapModel
                        .loadStoreManagementTabs()[index];
                    widget.onTabChanged(selectedTab);
                  });
                }),
              ));
            }),
          ),
        )
      ],
    );
  }
}
