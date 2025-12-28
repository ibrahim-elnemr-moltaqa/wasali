import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/data/model/api_delivery_model.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_bank_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_main_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_vehicle_data_use_case.dart';
import 'package:wasli/src/shared/auth/data/models/api_authentication_response.dart';
import 'package:wasli/src/shared/auth/data/models/api_user_model.dart';

@Injectable(as: DeliveryAuthenticationRepository)
class DeliveryAuthenticationRepositoryImpl
    implements DeliveryAuthenticationRepository {
  final DioHelper _dioHelper;
  final SecureStorageRepository _secureStorageRepository;
  DeliveryAuthenticationRepositoryImpl(
      this._dioHelper, this._secureStorageRepository);

  @override
  DomainServiceType<Unit> deliveryMainInformation(
      DeliveryMainInformationParams params) async {
    return await failureCollect(() async {
      final result = await _dioHelper.post(
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
    });
  }

  @override
  DomainServiceType<Unit> deliveryBankInfo(
      DeliveryBankInfoParams params) async {
    return await failureCollect(() async {
      await _dioHelper.post(
          url: params.isUpdate
              ? "auth/update_bank_info"
              : "auth/register_bank_info",
          body: params.toJson());
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> deliveryVehicleData(
      DeliveryVehicleParams params) async {
    return await failureCollect(() async {
      await _dioHelper.post(
          url: params.isUpdate
              ? "auth/update_vehicle_data"
              : "auth/register_vehicle_data",
          body: params.toJson());
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<DeliveryUserEntity> getDeliveryUser() async {
    return await failureCollect(() async {
      final result = await _dioHelper.get(url: "auth/profile");
      final data = ApiDeliveryUserModel.fromJson(result['data']['user']);
      return Right(data);
    });
  }

  @override
  DomainServiceType<Unit> deleteImage(int imageId, String type) async {
    return failureCollect(() async {
      await _dioHelper.post(
        url: "auth/delete-image/$imageId",
        body: {'type': type},
      );
      return const Right(unit);
    });
  }
}
