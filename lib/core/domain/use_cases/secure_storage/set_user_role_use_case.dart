part of core;

@Injectable()
class SetUserRoleUseCase {
  final SecureStorageRepository _repository;
  SetUserRoleUseCase(this._repository);
  factory SetUserRoleUseCase.getInstance() => SetUserRoleUseCase(
      SecureStorageRepositoryImp(SecureStorageDataSourceImpl()));
  Future<void> call(RoleEnum params) async {
    return await _repository.setUserRole(params);
  }
}
