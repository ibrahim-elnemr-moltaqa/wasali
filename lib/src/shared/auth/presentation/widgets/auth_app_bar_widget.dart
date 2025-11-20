import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';

class AuthAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBarWidget({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(14)),
          child: BackButton(
            onPressed: onPressed ?? () => AppRouter.pop(),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
