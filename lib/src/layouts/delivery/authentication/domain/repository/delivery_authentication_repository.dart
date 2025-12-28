import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_bank_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_main_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_vehicle_data_use_case.dart';

abstract class DeliveryAuthenticationRepository {
  DomainServiceType<Unit> deliveryMainInformation(
      DeliveryMainInformationParams params);
  DomainServiceType<Unit> deliveryBankInfo(DeliveryBankInfoParams params);
  DomainServiceType<Unit> deliveryVehicleData(DeliveryVehicleParams params);
  DomainServiceType<Unit> deleteImage(int imageId, String type);
  DomainServiceType<DeliveryUserEntity> getDeliveryUser();
}
