import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core.dart';
import 'guest_bottom_sheet.dart';

class GuestCheckerWidget extends StatelessWidget {
  const GuestCheckerWidget({
    super.key,
    required this.child,
    this.guestWidget,
    this.enableGesture = false,
    this.replaceWithDefaultGuestWidget = false,
  });
  final Widget child;
  final Widget? guestWidget;
  final bool enableGesture;
  final bool replaceWithDefaultGuestWidget;

  static void check(BuildContext context,
      {void Function()? caseGuest, void Function()? elseCase}) {
    if (AppAuthenticationBloc.of(context).state is GuestState) {
      if (caseGuest != null) {
        caseGuest();
      }
    } else {
      if (elseCase != null) {
        elseCase();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthenticationBloc, AppAuthenticationState>(
      builder: (context, state) {
        if (state is GuestState) {
          if (enableGesture && replaceWithDefaultGuestWidget == false) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  GuestBottomSheet.show(context);
                },
                child: AbsorbPointer(child: child));
          } else if (replaceWithDefaultGuestWidget) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: GuestBottomSheet(),
              ),
            );
          } else {
            return guestWidget ?? const SizedBox();
          }
        } else {
          return child;
        }
      },
    );
  }
}
