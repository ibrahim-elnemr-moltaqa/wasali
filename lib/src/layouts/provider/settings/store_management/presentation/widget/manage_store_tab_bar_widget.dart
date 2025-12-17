import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/provider/authentication/data/model/store_management_model.dart';

class ManageStoreTapBarWidget extends StatefulWidget {
  const ManageStoreTapBarWidget({
    super.key,
    required this.onTabChanged,
    required this.selectedIndex,
  });

  final ValueChanged<int> onTabChanged;
  final int selectedIndex;

  @override
  State<ManageStoreTapBarWidget> createState() =>
      _ManageStoreTapBarWidgetState();
}

class _ManageStoreTapBarWidgetState extends State<ManageStoreTapBarWidget> {
  @override
  Widget build(BuildContext context) {
    final tabs = StoreManagementTapModel.loadStoreManagementTabs();
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
            children: List.generate(tabs.length, (index) {
              final isSelected = index == widget.selectedIndex;

              return Expanded(
                  child: IntrinsicWidth(
                child: Column(
                  children: [
                    Text(
                      tabs[index].title,
                      style:
                          isSelected ? TextStyles.bold14 : TextStyles.regular14,
                    ),
                    if (isSelected) ...{
                      const Gap(4),
                      Divider(
                        color: AppColors.primary,
                        thickness: 2,
                      ),
                    }
                  ],
                ).onTapScaleAnimation(onTap: () {
                  setState(() {
                    widget.onTabChanged(index);
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
