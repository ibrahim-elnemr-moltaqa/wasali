import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';

import '../../core.dart';

const String _tokenKey = "CacheTokenKey";
const String _cacheUserDataKey = "CacheUserDataKey";

abstract class SecureStorageDataSource {
  Future<void> setToken(TokenModel token);
  Future<TokenModel?> getToken();
  Future<void> setCachedUser(CacheUserModel user);
  Future<CacheUserModel?> getCachedUser();
  Future<void> setUserRole(RoleEnum role);
  Future<RoleEnum?> getUserRole();
  Future<void> deleteAllCache();

}

@Injectable(as: SecureStorageDataSource)
class SecureStorageDataSourceImpl implements SecureStorageDataSource {
  final FlutterSecureStorage _storageObj = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  Future<void> setToken(TokenModel token) async {
    try {
      await _storageObj.write(key: _tokenKey, value: token.toJson);
      debugPrint(
          "[SecureStorageDataSource] ::: Token Saved Successfully \n[${token.toString()}]");
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to save token to cache ، please try again",
      );
    }
  }

  @override
  Future<TokenModel?> getToken() async {
    try {
      final json = await _storageObj.read(key: _tokenKey);
      if (json != null) {
        final token = TokenModel.fromCache(json);
        debugPrint(
            "[SecureStorageDataSource] ::: Get Token Successfully \n[${token.toString()}]");
        return token;
      }
      return null;
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to get token from cache ، please try again",
      );
    }
  }

  @override
  Future<void> setCachedUser(CacheUserModel user) async {
    try {
      await _storageObj.write(key: _cacheUserDataKey, value: user.toJson);
      debugPrint(
          "[SecureStorageDataSource] ::: Cache User Saved Successfully\n${user.toString()}");
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to save cached user to cache ، please try again",
      );
    }
  }

  @override
  Future<CacheUserModel?> getCachedUser() async {
    try {
      final json = await _storageObj.read(key: _cacheUserDataKey);
      if (json != null) {
        final cachedData = CacheUserModel.fromJson(json);
        return cachedData;
      }
      return null;
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to get cached user from cache ، please try again",
      );
    }
  }

  @override
  Future<void> setUserRole(RoleEnum role) async {
    try {
      return _storageObj.write(key: 'user_role', value: role.name);
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to save user role to cache ، please try again",
      );
    }
  }

  @override
  Future<RoleEnum?> getUserRole() async {
    try {
      return _storageObj.read(key: 'user_role').then((value) {
        if (value != null) {
          return RoleEnum.values.firstWhere((role) => role.name == value,
              orElse: () => RoleEnum.guest);
        }
        return null;
      });
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to get user role from cache ، please try again",
      );
    }
  }

  
  @override
  Future<void> deleteAllCache() async{
    try {
      await _storageObj.deleteAll();
    } catch (_) {
      throw SecureStorageException(
        message: "Failed to delete all cache ، please try again",
      );
    }
    
  }
}
