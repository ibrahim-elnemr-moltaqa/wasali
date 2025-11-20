import '../../core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler {
  PermissionsHandler._();

  /// Requests the specified permission and returns the result.
  static Future<PermissionStatus> requestPermission(
      Permission permission) async {
    final status = await permission.request();
    return status;
  }

  /// Checks if the specified permission is granted.
  static Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  /// Opens the app settings to allow the user to change permissions.
  static Future<void> openSettings() async {
    await openAppSettings();
  }

  static Future<PermissionStatus> requestNotificationsPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    } else if (status.isPermanentlyDenied) {
      Fluttertoast.showToast(msg: appLocalizer.enableNotificationsRequest);
      await openAppSettings();
    }
    return status;
  }

  /// Checks if notifications permission is granted.
  static Future<bool> checkNotificationsPermission() async {
    final status = await isPermissionGranted(Permission.notification);
    return status;
  }
}
