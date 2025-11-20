import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/config/values/assets.gen.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:flutter/material.dart';

class ConversationCardWidget extends StatelessWidget {
  const ConversationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRouter.pushNamed(
        AppRoutes.chatDetailsPage,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary50),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 8,
          children: [
            AppImage(
              path: Assets.images.appbarBackground,
              width: 40,
              height: 40,
              radius: 999,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'إدارة بُنيان تِك',
                            style: TextStyles.light14,
                          ),
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.primary),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'تم مراجعة بياناتك الرجاء التأكد',
                            style: TextStyles.light10,
                          ),
                        ),
                        Text(
                          '20/7/2025',
                          style: TextStyles.light10,
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
