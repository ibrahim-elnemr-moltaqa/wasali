import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';

import '../../core.dart';
import '../data_source/secure_storage_data_source.dart';

@Injectable(as: SecureStorageRepository)
class SecureStorageRepositoryImp implements SecureStorageRepository {
  final SecureStorageDataSource _dataSource;

  const SecureStorageRepositoryImp(this._dataSource);

  @override
  Future<Token?> getToken() async {
    try {
      return await _dataSource.getToken();
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to get token");
      return null;
    }
  }

  @override
  Future<void> setToken(Token token) async {
    try {
      await _dataSource.setToken(TokenModel.fromEntity(token));
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to delete token");
    }
  }

  @override
  Future<void> setCachedUser(CachedUser user) async {
    try {
      return await _dataSource.setCachedUser(CacheUserModel.fromEntity(user));
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to set cached user");
    }
  }

  @override
  Future<CachedUser?> getCachedUser() async {
    try {
      return await _dataSource.getCachedUser();
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to get cached user");
      return null;
    }
  }

  @override
  Future<RoleEnum?> getUserRole() async {
    try {
      return await _dataSource.getUserRole();
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to get user role");
      return null;
    }
  }

  @override
  Future<void> setUserRole(RoleEnum role) async {
    try {
      await _dataSource.setUserRole(role);
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to set user role");
    }
  }

  @override
  Future<void> deleteAllCache() async {
    try {
      await _dataSource.deleteAllCache();
    } catch (_) {
      debugPrint("[SecureStorageRepository] Failed to delete all cache");
    }
  }
}
