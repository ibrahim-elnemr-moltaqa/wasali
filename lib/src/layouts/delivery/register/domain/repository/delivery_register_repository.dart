import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_bank_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_register_use_case.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_vehicle_data_use_case.dart';

abstract class DeliveryRegisterRepository {
  DomainServiceType<Unit> deliveryRegister(DeliveryRegisterParams params);
  DomainServiceType<Unit> deliveryBankInfo(DeliveryBankInfoParams params);
  DomainServiceType<Unit> deliveryVehicle(DeliveryVehicleParams params);
}
