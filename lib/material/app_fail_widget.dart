import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/core.dart';

class AppFailWidget extends StatelessWidget {
  const AppFailWidget({
    super.key,
    this.text,
    this.onRetry,
    this.textStyle = TextStyles.semiBold12,
    this.refreshIconSize = 16,
    this.margin,
  });
  final String ? text;
  final void Function()? onRetry;
  final TextStyle textStyle;
  final double refreshIconSize;
  final EdgeInsetsGeometry? margin;

  static const String routeName = "AppFailWidgetOverlay";

  static Future<void> overlay(VoidCallback onRetry) async {
    final currentRouteName = AppRouter.getCurrentRoute;

    if (currentRouteName == routeName) return;
    final context = AppRouter.appContext;
    FocusScope.of(context).unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: routeName),
      barrierLabel: routeName,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: PopScope(
                canPop: false,
                child: Container(
                  height: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  width: MediaQuery.of(context).size.width * 0.75,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.canvasBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [AppColors.boxShadow]),
                  child: AppFailWidget(
                    onRetry: () {
                      Navigator.pop(context);
                      onRetry();
                    },
                  ),
                )),
          ),
        );
      },
    );
  }

  static void removeOverlay({bool rootNavigator = true}) {
    final currentRoute = AppRouter.getCurrentRoute;
    if (currentRoute == routeName) {
      final context = appNavigatorKey.currentContext;
      if (context != null && context.mounted) {
        Navigator.of(context, rootNavigator: rootNavigator).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onRetry,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
              text??   appLocalizer.failToLoad,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Icon(
              Icons.refresh_rounded,
              size: refreshIconSize,
            )
          ],
        ),
      ),
    );
  }
}
