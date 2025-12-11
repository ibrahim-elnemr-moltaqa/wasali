import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/register/domain/repository/provider_register_repository.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_main_information_use_case.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_store_address_params.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_store_data_use_case.dart';
import 'package:wasli/src/shared/auth/data/models/api_authentication_response.dart';

@Injectable(as: ProviderRegisterRepository)
class ProviderRegisterRepositoryImpl implements ProviderRegisterRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorageRepository;

  ProviderRegisterRepositoryImpl(
      this._apiHelper, this._secureStorageRepository);
  @override
  DomainServiceType<Unit> providerRegisterMainInformations(
      MainInformationsParams params) async {
    return await failureCollect(
      () async {
        final result =
            await _apiHelper.post(url: "auth/register", body: params.toJson());
        final data = ApiLoggedUserResponse.fromJson(result['data']);
        await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
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
            url: "auth/register_store_address", body: params.toJson());
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
            url: "auth/register_store_data", body: params.toJson());
        return const Right(unit);
      },
    );
  }
}
