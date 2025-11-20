import 'package:flutter/material.dart';
import '../../core/core.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool useRootNavigator = true,
  String? headerText,
  Widget? headerWidget,
  TextStyle headerStyle = TextStyles.regular16,
  AlignmentGeometry openAlign = Alignment.center,
  double maxWidth = 300,
  bool isScrollable = false,
  final String routeName = "showAppDialog",
}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: isDismissible,
    barrierLabel: routeName,
    routeSettings: RouteSettings(name: routeName),
    useRootNavigator: useRootNavigator,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (_, __, ___) {
      return _DialogShape(
        maxWidth: maxWidth,
        headerText: headerText,
        headerStyle: headerStyle,
        headerWidget: headerWidget,
        isScrollable: isScrollable,
        child: child,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final offset = getBeingOffsetAccordingDirection(openAlign);
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: child,
          ),
        ),
      );
    },
  );
}

Offset getBeingOffsetAccordingDirection(AlignmentGeometry align) {
  if (align == Alignment.topCenter) return const Offset(0, -1);
  if (align == Alignment.topRight) return const Offset(1, -1);
  if (align == Alignment.topLeft) return const Offset(-1, -1);
  if (align == Alignment.centerLeft) return const Offset(-1, 0);
  if (align == Alignment.centerRight) return const Offset(1, 0);
  if (align == Alignment.bottomCenter) return const Offset(0, 1);
  if (align == Alignment.bottomLeft) return const Offset(-1, 1);
  if (align == Alignment.bottomRight) return const Offset(1, 1);
  if (align == AlignmentDirectional.centerEnd) {
    return isLTR ? const Offset(-1, 0) : const Offset(1, 0);
  }
  if (align == AlignmentDirectional.centerStart) {
    return isLTR ? const Offset(1, 0) : const Offset(-1, 0);
  }
  return const Offset(0, -1);
}

TextDirection get appDirectionality {
  final context = appNavigatorKey.currentContext;
  return context != null && context.mounted
      ? Directionality.of(context)
      : TextDirection.ltr;
}

bool get isLTR => appDirectionality == TextDirection.ltr;

class _DialogShape extends StatelessWidget {
  const _DialogShape({
    required this.maxWidth,
    this.headerText,
    this.headerWidget,
    required this.headerStyle,
    required this.child,
    required this.isScrollable,
  });

  final double maxWidth;
  final String? headerText;
  final TextStyle headerStyle;
  final Widget? headerWidget;
  final Widget child;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics: isScrollable
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 268,
              maxWidth: maxWidth,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 24,
                  spreadRadius: 4,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (headerText?.isNotEmpty == true || headerWidget != null)
                  const SizedBox(height: 20),
                if (headerText?.isNotEmpty == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      headerText!,
                      textAlign: TextAlign.center,
                      style: headerStyle,
                    ),
                  )
                else if (headerWidget != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: headerWidget!,
                  ),
                if (headerText?.isNotEmpty == true || headerWidget != null)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    height: 2,
                    color: AppColors.primary600,
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
