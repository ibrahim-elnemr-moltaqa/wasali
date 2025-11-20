import 'package:flutter/widgets.dart';
import '../../../../../core/core.dart';
import '../../../../../material/media/svg_icon.dart';

class AuthenticationTile extends StatelessWidget {
  const AuthenticationTile({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        spacing: 4,
        children: [
          AppSvgIcon(path: icon),
          Expanded(
              child: Text(
            text,
            style: TextStyles.regular16.copyWith(color: AppColors.primary500),
          )),
        ],
      ),
    );
  }
}
