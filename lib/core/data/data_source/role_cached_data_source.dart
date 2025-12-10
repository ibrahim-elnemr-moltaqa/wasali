import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';

abstract class RoleCachedDataSource {
  Future<void> setRole(RoleEnum role);
  Future<RoleEnum?> getRole();
  Future<void> deleteRole();
}

class RoleCachedDataSourceImpl implements RoleCachedDataSource {
  static const String _roleKey = "USER_ROLE";

  Future<SharedPreferences> get _prefs async =>
      SharedPreferences.getInstance();

  @override
  Future<void> setRole(RoleEnum role) async {
    final prefs = await _prefs;
    await prefs.setString(_roleKey, role.name);
  }

  @override
  Future<RoleEnum?> getRole() async {
    final prefs = await _prefs;
    final roleString = prefs.getString(_roleKey);
    if (roleString == null) return null;

    return RoleEnum.values.firstWhere(
      (e) => e.name == roleString,
      orElse: () => RoleEnum.guest,
    );
  }

  @override
  Future<void> deleteRole() async {
    final prefs = await _prefs;
    await prefs.remove(_roleKey);
  }
}