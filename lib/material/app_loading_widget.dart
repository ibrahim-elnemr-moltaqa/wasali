import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/core.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.size = 30,
    this.strokeWidth = 4.0,
    this.color = Colors.black,
    this.useAnimatedLoading = false,
  });

  final double size;
  final double strokeWidth;
  final Color color;
  final bool useAnimatedLoading;

  static const String routeName = "AppLoadingOverlay";

  static Future<void> overlay({bool rootNavigator = true}) async {
    final currentRouteName = AppRouter.getCurrentRoute;

    if (currentRouteName == routeName) return;
    final context = AppRouter.appContext;
    FocusScope.of(context).unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: rootNavigator,
      routeSettings: const RouteSettings(name: routeName),
      barrierLabel: routeName,
      builder: (BuildContext context) {
        return PopScope(
            canPop: false,
            child: Center(
              child: Container(
                  height: 120,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.canvasBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [AppColors.boxShadow]),
                  child: const LogoLoading()),
            ));
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
    if (useAnimatedLoading) {
      return const LogoLoading();
    } else {
      return DefaultLoading(
        color: color,
        size: size,
        strokeWidth: strokeWidth,
      );
    }
  }
}

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({
    super.key,
    this.size = 30,
    this.strokeWidth = 4,
    this.color,
  });

  final double size;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class LogoLoading extends StatelessWidget {
  const LogoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
