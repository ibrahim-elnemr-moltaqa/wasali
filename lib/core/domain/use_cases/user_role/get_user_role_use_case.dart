part of core;

@Injectable()
class GetUserRoleUseCase {
  final RoleCachedDataSource _roleCachedDataSource;
  GetUserRoleUseCase(this._roleCachedDataSource);

  factory GetUserRoleUseCase.getInstance() =>
      GetUserRoleUseCase(RoleCachedDataSourceImpl());
  Future<RoleEnum?> call() {
    return _roleCachedDataSource.getRole();
  }
}
