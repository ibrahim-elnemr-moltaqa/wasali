part of core;

@Injectable()
class SetUserRoleUseCase {
  final RoleCachedDataSource _roleCachedDataSource;

  SetUserRoleUseCase(this._roleCachedDataSource);

  factory SetUserRoleUseCase.getInstance() =>
      SetUserRoleUseCase(RoleCachedDataSourceImpl());

  Future<void> call(RoleEnum role) {
    return _roleCachedDataSource.setRole(role);
  }
}
