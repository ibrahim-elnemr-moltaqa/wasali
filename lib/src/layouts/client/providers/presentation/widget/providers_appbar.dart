import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/common/presentation/widget/custom_app_bar.dart';

class ProvidersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProvidersAppBar({
    super.key,
    this.actions,
  });
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      context,
      title: Row(
        children: [
          Text(appLocalizer.deliveryTo, style: TextStyles.regular14),
          const Gap(4),
          const Text('أحمد ماهر, المنصورة', style: TextStyles.bold16),
        ],
      ),
      actions: actions ??
          [
            AppSvgIcon(
              path: AppIcons.bag,
            )
                .setBorder(
                  radius: 12,
                  padding: const EdgeInsets.all(8),
                )
                .paddingEnd(12)
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
