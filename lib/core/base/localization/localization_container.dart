part of core;

/// Used For easy access [appLocalizations] without need [context]
///
/// @Author: Moltaqa's Flutter Team
AppLocalizations get appLocalizer =>
    injector<LocalizationContainer>().appLocalizations;

/// Used For easy access [locale] without need [context]
/// If [context] is null or not mounted, it will return [locale] from [LocalizationContainer]
/// If [context] is not null, it will return [locale] from [context]
///
/// @Author: Moltaqa's Flutter Team
Locale get getLocale {
  try {
    final context = appNavigatorKey.currentContext;
    if (context != null && context.mounted) {
      return Localizations.localeOf(context);
    }
    return injector<LocalizationContainer>().appLanguage.local;
  } catch (_) {
    return const Locale("en");
  }
}

/// Used For easy access [AppLanguageType] without need [context]
///
/// @Author: Moltaqa's Flutter Team
AppLanguageType get getLocaleTypeEnum {
  try {
    return AppLanguageType.fromLanguageCode(getLocale.languageCode);
  } catch (_) {
    return AppLanguageType.ar;
  }
}

/// This class will be registered manually in initializeDependencies()
/// Initial [AppLanguageType] value is set in [LanguagePreferencesHelper]
/// @LazySingleton()
///
/// @Author: Moltaqa's Flutter Team

class LocalizationContainer {
  final _getLanguageUseCase = GetCachedLanguageUseCase.getInstance();
  final _setLanguageUseCase = SetCachedLanguageUseCase.getInstance();

  LocalizationContainer();

  AppLanguageType _lang = AppLanguageType.en; 

  AppLanguageType get appLanguage => _lang;

  AppLocalizations appLocalizations = AppLocalizationsEn();

  // @PostConstruct(preResolve: true)
  Future<Locale> init() async {
    Locale locale;
    _lang = await _getLanguageUseCase();
    locale = _lang.local;
    return locale;
  }

  Future<void> setLanguage(AppLanguageType lang) async {
    _lang = lang;
    await _setLanguageUseCase(lang);
  }

  /// Used For easy access [appLocalizer] without need [context]
  void setLocalizer(BuildContext context) {
    appLocalizations = AppLocalizations.of(context);
  }
}
