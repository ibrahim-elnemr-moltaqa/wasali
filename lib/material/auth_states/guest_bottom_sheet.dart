import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../media/svg_icon.dart';
import '../overlay/show_modal_bottom_sheet.dart';
import '../../src/shared/auth/presentation/widgets/authentication_header_widget.dart';
import '../buttons/app_button.dart';

const String _routeName = "GuestDialog";

class GuestBottomSheet extends StatelessWidget {
  const GuestBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    final currentRouteName = AppRouter.getCurrentRoute;
    if (_routeName == currentRouteName) return;
    return await showAppTopModalSheet<void>(
      context: context,
      child: const GuestBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppSvgIcon(
            path: "assets/icons/circle-logo-ic.svg",
          ),
          AuthenticationHeaderWidget(
            subHeader: appLocalizer.geustHint,
            hasLogo: false,
            style: TextStyles.regular14, 
          ),
          Theme(
            data: Theme.of(context).copyWith(
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                          minimumSize: WidgetStateProperty.all(const Size(100, 40)),
                        ))),
            child: AppButton(
              text: appLocalizer.login,
              onPressed: () {
                AppRouter.popUntil();
                AppAuthenticationBloc.of(context).add(LoggedOutEvent());
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
