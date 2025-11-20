import 'package:wasli/core/config/values/assets.gen.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:flutter/material.dart';

class ChatSearchBarWidget extends StatelessWidget {
  const ChatSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: appLocalizer.searchByServiceProvider,
            prefixIcon: (context) => AppSvgIcon(
              path: Assets.icons.search,
            ),
          ),
        ),
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.all(9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            icon: AppSvgIcon(
              height: 24,
              width: 24,
              path: AppIcons.search,
              color: Colors.white,
            ))
      ],
    );
  }
}
