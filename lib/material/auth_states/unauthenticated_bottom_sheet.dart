import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../overlay/show_modal_bottom_sheet.dart';
import '../../src/shared/auth/presentation/widgets/authentication_header_widget.dart';
import '../buttons/app_button.dart';


class UnAuthenticatedBottomSheet extends StatelessWidget {
  const UnAuthenticatedBottomSheet._();
  static String routeName = "UnAuthenticatedBottomSheet";


  static Future<void> show() async {
    if (AppRouter.getCurrentRoute == routeName) {
      return;
    }

    await showAppModalBottomSheet(
      context: AppRouter.appContext,
      isDismissible: false,
      routeSettings: RouteSettings(name: routeName),
      child: const UnAuthenticatedBottomSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // const AppSvgIcon(
          //   path: "assets/illustrations/guest_login_illustration.svg",
          // ),
          const SizedBox(height: 16),
          AuthenticationHeaderWidget(
            subHeader: appLocalizer.unAuthenticatedMessage,
            hasLogo: false,
            style: TextStyles.semiBold14,
          ),
          const SizedBox(height: 32),
          AppButton(
            text: appLocalizer.login,
            onPressed: () {
              AppRouter.popUntil();
              AppAuthenticationBloc.of(context).add(LoggedOutEvent());
            },
          ),
        ],
      ),
    );
  }
}
