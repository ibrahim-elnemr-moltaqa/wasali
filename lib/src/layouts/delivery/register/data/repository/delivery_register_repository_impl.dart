import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/register/domain/repository/delivery_register_repository.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_bank_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_register_use_case.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_vehicle_data_use_case.dart';
import 'package:wasli/src/shared/auth/data/models/api_authentication_response.dart';

@Injectable(as: DeliveryRegisterRepository)
class DeliveryRegisterRepositoryImpl implements DeliveryRegisterRepository {
  final DioHelper _dioHelper;
  final SecureStorageRepository _secureStorageRepository;
  DeliveryRegisterRepositoryImpl(
      this._dioHelper, this._secureStorageRepository);

  @override
  DomainServiceType<Unit> deliveryRegister(
      DeliveryRegisterParams params) async {
    return await failureCollect(() async {
      final result =
          await _dioHelper.post(url: "auth/register", body: params.toJson());
      final data = ApiLoggedUserResponse.fromJson(result['data']);
      await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> deliveryBankInfo(
      DeliveryBankInfoParams params) async {
    return await failureCollect(() async {
      await _dioHelper.post(
          url: "auth/register_bank_info", body: params.toJson());
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> deliveryVehicle(DeliveryVehicleParams params) async {
    return await failureCollect(() async {
      await _dioHelper.post(
          url: "auth/register_vehicle_data", body: params.toJson());
      return const Right(unit);
    });
  }
}
