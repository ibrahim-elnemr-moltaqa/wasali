part of core;

abstract class SecureStorageRepository {
  Future<Token?> getToken();
  Future<void> setToken(Token token);
  Future<void> setCachedUser(CachedUser user);
  Future<CachedUser?> getCachedUser();
  Future<void> deleteAllCache();
}
