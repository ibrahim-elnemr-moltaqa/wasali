import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kCacheLanguageCodeKey = "LanguageCodeKey";

abstract class LanguageCacheDateSource {
  Future<AppLanguageType> getLanguage();
  Future<bool> setLanguageCode(AppLanguageType language);
  Future<AppLanguageType> getDeviceLanguage();
  AppLanguageType get getDefaultAppLanguage;
  Future<void> clearCache();
}

@Injectable(as: LanguageCacheDateSource)
class LanguageCacheDateSourceImp implements LanguageCacheDateSource {
  LanguageCacheDateSourceImp();
  SharedPreferences? _shardPreferences;
  Future<SharedPreferences> get _getPrefInstance async =>
      _shardPreferences ??= await SharedPreferences.getInstance();

  @override
  Future<bool> setLanguageCode(AppLanguageType language) async {
    try {
      await (await _getPrefInstance)
          .setString(_kCacheLanguageCodeKey, language.toJson);
      return true;
    } catch (e) {
      debugPrint("[LanguageCacheDateSource] Failed to set Language");
      return false;
    }
  }

  @override
  Future<AppLanguageType> getLanguage() async {
    try {
      final String? languageCode =
          (await _getPrefInstance).getString(_kCacheLanguageCodeKey)?.trim();
      if (languageCode != null) {
        return AppLanguageType.fromJson(languageCode);
      } else {
        return getDeviceLanguage();
      }
    } catch (e) {
      debugPrint("[LanguageCacheDateSource] Failed to get Language");
      return getDeviceLanguage();
    }
  }

  @override
  Future<AppLanguageType> getDeviceLanguage() async {
    try {
      final String? deviceLangCode = Platform.localeName.split("_").firstOrNull;
      final deviceLangEnum = AppLanguageType.values.firstWhereOrNull(
          (element) =>
              element.value.toLowerCase() == deviceLangCode?.toLowerCase());
      return deviceLangEnum ?? getDefaultAppLanguage;
    } catch (_) {
      debugPrint("[LanguageCacheDateSource] Failed to get Device Language");
      return getDefaultAppLanguage;
    }
  }

  @override
  AppLanguageType get getDefaultAppLanguage => AppLanguageType.en;

  @override
  Future<void> clearCache() async {
    try {
      await (await _getPrefInstance).remove(_kCacheLanguageCodeKey);
    } catch (_) {
      debugPrint("[LanguageCacheDateSource] Failed to get clear cache");
    }
  }
}
