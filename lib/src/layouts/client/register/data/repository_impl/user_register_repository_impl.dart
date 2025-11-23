import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/register/domain/repository/user_register_repository.dart';
import 'package:wasli/src/layouts/client/register/domain/use_case/user_register_use_case.dart';
import 'package:wasli/src/shared/auth/data/models/api_authentication_response.dart';

@Injectable(as: UserRegisterRepository)
class UserRegisterRepositoryImpl implements UserRegisterRepository{
    final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorageRepository;

  UserRegisterRepositoryImpl(this._apiHelper, this._secureStorageRepository);
  @override
  DomainServiceType<Unit> register(RegisterParams params) async {
    return await failerCollect(
      () async {
        final result =
            await _apiHelper.post(url: "auth/register", body: params.toMap);
        final data = ApiLoggedUserResponse.fromJson(result['data']);
        await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
        return const Right(unit);
      },
    );
  }
}