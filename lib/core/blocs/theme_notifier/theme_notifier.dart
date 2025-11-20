import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/theme/app_theme.dart';
import '../../config/theme/dark_theme.dart';
import '../../config/theme/light_theme.dart';
import '../../data/repository/theme_repository_imp.dart';
import '../../domain/repository/theme_repository.dart';

class ThemeNotifier extends ChangeNotifier
    implements ValueListenable<AppTheme> {
  ThemeNotifier._();

  static ThemeNotifier? _instance;
  static ThemeNotifier get instance {
    return _instance ??= ThemeNotifier._();
  }

  factory ThemeNotifier() => instance;

  final ThemeRepository _themeRepostory = ThemeRepositoryImp();
  AppTheme _theme = const LightTheme();
  AppTheme get theme => _theme;

  ThemeMode get themeMode =>
      _theme is LightTheme ? ThemeMode.light : ThemeMode.dark;

  Future<void> initialize() async {
    try {
      _theme = await _themeRepostory.getTheme();
      _manageSystemUIOverlayStyle();
      notifyListeners();
    } catch (_) {
      debugPrint("[ThemeNotifier] ::: Failed to initialize theme :::");
    }
  }

  Future<void> changeTheme({AppTheme? theme}) async {
    try {
      final AppTheme changedTheme;
      if (theme != null) {
        changedTheme = theme;
      } else if (_theme is DarkTheme) {
        changedTheme = const LightTheme();
      } else {
        changedTheme = const DarkTheme();
      }
      _theme = await _themeRepostory.changeTheme(changedTheme);
      _manageSystemUIOverlayStyle();
      notifyListeners();
    } catch (_) {
      debugPrint("[ThemeNotifier] ::: Failed to change theme :::");
    }
  }

  void _manageSystemUIOverlayStyle() {
    if (_theme is LightTheme) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light,
      );
    }
  }

  @override
  AppTheme get value => _theme;
}

class ThemeBuilder extends StatefulWidget {
  const ThemeBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, AppTheme theme) builder;

  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder>
    with WidgetsBindingObserver {
  Brightness? _previousBrightness;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _previousBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  @override
  void didChangePlatformBrightness() {
    final newBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (_previousBrightness != newBrightness) {
      _previousBrightness = newBrightness;
      ThemeNotifier.instance.changeTheme();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeNotifier.instance,
      builder: (context, theme, child) {
        return widget.builder(context, theme);
      },
    );
  }
}
