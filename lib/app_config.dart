import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasli/src/shared/notifications/helpers/firebase/firebase_helper.dart';
import 'core/blocs/theme_notifier/theme_notifier.dart';
// import 'src/notifications/helpers/firebase/firebase_helper.dart';
import 'core/di/di.dart';

Future<void> initializeAppConfig() async {
  // Ensure that the Flutter engine is properly initialized.
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Set the system UI mode to manual, displaying all system UI overlays.
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  // Initialize application dependencies (e.g., services, providers, shared preferences, dio helper...etc).
  await initializeDependencies();

  // Initialize Firebase services.
  await FirebaseHelper.init();

  // To increase image cache size
  PaintingBinding.instance.imageCache.maximumSizeBytes = 250 << 20;

  SystemChannels.textInput.invokeMethod('TextInput.hide');

  await ThemeNotifier.instance.initialize();
}
