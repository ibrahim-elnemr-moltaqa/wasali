import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/data/model/api_provider_model.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_main_information_use_case.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_address_params.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_data_use_case.dart';
import 'package:wasli/src/shared/auth/data/models/api_authentication_response.dart';
import 'package:wasli/src/shared/auth/data/models/api_user_model.dart';

@Injectable(as: ProviderAuthenticationRepository)
class ProviderRegisterRepositoryImpl
    implements ProviderAuthenticationRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorageRepository;

  ProviderRegisterRepositoryImpl(
      this._apiHelper, this._secureStorageRepository);
  @override
  DomainServiceType<Unit> providerRegisterMainInformations(
      MainInformationsParams params) async {
    return await failureCollect(
      () async {
        final result = await _apiHelper.post(
            url: params.isUpdate ? "auth/update-profile" : "auth/register",
            body: params.toJson());
        if (!params.isUpdate) {
          final data = ApiLoggedUserResponse.fromJson(result['data']);
          await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
        } else {
          final data = ApiUserModel.fromJson(result['data']['user']['user']);
          await _secureStorageRepository.setCachedUser(data.mapToCacheEntity);
        }
        return const Right(unit);
      },
    );
  }

  @override
  DomainServiceType<Unit> providerRegisterStoreAddress(
      StoreAddressParams params) async {
    return await failureCollect(
      () async {
        await _apiHelper.post(
            url: params.isUpdate
                ? "auth/update-store-address"
                : "auth/register_store_address",
            body: params.toJson());
        return const Right(unit);
      },
    );
  }

  @override
  DomainServiceType<Unit> providerRegisterStoreInformations(
      StoreDataParams params) async {
    return await failureCollect(
      () async {
        await _apiHelper.post(
            url: params.isUpdate
                ? "auth/update-store-data"
                : "auth/register_store_data",
            body: params.toJson());
        return const Right(unit);
      },
    );
  }

  @override
  DomainServiceType<ProviderEntity> getProvider() async {
    return await failureCollect(
      () async {
        final result = await _apiHelper.get(url: "auth/profile");
        final data = ApiProviderModel.fromJson(result['data']['user']);
        return Right(data);
      },
    );
  }
}
