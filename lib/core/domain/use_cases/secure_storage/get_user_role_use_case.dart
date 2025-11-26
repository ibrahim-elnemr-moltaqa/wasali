part of core;

@Injectable()
class GetUserRoleUseCase {
  final SecureStorageRepository _repository;
  GetUserRoleUseCase(this._repository);

  factory GetUserRoleUseCase.getInstance() => GetUserRoleUseCase(
      SecureStorageRepositoryImp(SecureStorageDataSourceImpl()));
  Future<RoleEnum?> call() async => await _repository.getUserRole();
}
