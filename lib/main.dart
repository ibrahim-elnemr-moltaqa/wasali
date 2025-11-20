import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'app_config.dart';
import 'my_app.dart';

void main() async {
  await initializeAppConfig();
  // ThemeNotifier.instance.changeTheme(theme: LightTheme());
  // await (DeleteAllSecureCacheUseCase.getInstance()).call();
  // commentttt
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  ));
}
