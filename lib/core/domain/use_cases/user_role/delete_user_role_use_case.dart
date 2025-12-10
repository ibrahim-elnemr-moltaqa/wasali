part of core;

@Injectable()
class DeleteUserRoleUseCase {
  final RoleCachedDataSource _roleCachedDataSource;
  DeleteUserRoleUseCase(this._roleCachedDataSource);

  factory DeleteUserRoleUseCase.getInstance() =>
      DeleteUserRoleUseCase(RoleCachedDataSourceImpl());

  Future<void> call() {
    return _roleCachedDataSource.deleteRole();
  }
}
