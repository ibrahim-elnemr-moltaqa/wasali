import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';

class ProvidersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProvidersAppBar({
    super.key,
    this.actions,
  });
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton().setBorder(radius: 12).paddingAll(10),
      title: Text.rich(TextSpan(children: [
        TextSpan(text: appLocalizer.delvieryTo, style: TextStyles.regular14),
        const TextSpan(text: ' '),
        const TextSpan(text: 'أحمد ماهر, المنصورة', style: TextStyles.bold16),
      ])),
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
