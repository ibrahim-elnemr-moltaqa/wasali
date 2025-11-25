import 'package:flutter/cupertino.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/permissions/permissions_handler.dart';

extension OppositeDirectionality on BuildContext {
  TextDirection get oppositeDirectionality {
    final current = Directionality.of(this);
    return current == TextDirection.ltr ? TextDirection.rtl : TextDirection.ltr;
  }
}

class NotificationSwitch extends StatefulWidget {
  const NotificationSwitch({super.key});

  @override
  State<NotificationSwitch> createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch>
    with WidgetsBindingObserver {
  bool notificationSettingsEnabled = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    final isGranted = await PermissionsHandler.checkNotificationsPermission();
    if (mounted) {
      setState(() {
        notificationSettingsEnabled = isGranted;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkNotificationPermission();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.oppositeDirectionality,
      child: Transform.scale(
        alignment: AlignmentDirectional.centerStart,
        scale: 0.53,
        child: CupertinoSwitch(
          activeTrackColor: AppColors.primary,
          value: notificationSettingsEnabled,
          onChanged: (newVal) {
            PermissionsHandler.openSettings();
          },
        ),
      ),
    );
  }
}
