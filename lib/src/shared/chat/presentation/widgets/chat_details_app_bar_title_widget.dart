import 'package:wasli/core/config/values/assets.gen.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:flutter/material.dart';

class ChatDetailsAppBarTitleWidget extends StatelessWidget {
  const ChatDetailsAppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          spacing: 4,
          children: [
            AppImage(
              path: Assets.images.appbarBackground,
              width: 32,
              height: 32,
              radius: 999,
              fit: BoxFit.fill,
            ),
            const Text(
              'إدارة بُنيان تِك',
              style: TextStyles.regular14,
            )
          ],
        );
  }
}