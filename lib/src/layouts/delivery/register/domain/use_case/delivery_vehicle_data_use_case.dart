import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/register/domain/repository/delivery_register_repository.dart';

@injectable
class DeliveryVehicleDataUseCase extends IUseCase<Unit, DeliveryVehicleParams> {
  final DeliveryRegisterRepository repository;

  DeliveryVehicleDataUseCase(this.repository);

  @override
  DomainServiceType<Unit> call(DeliveryVehicleParams params) async =>
      await repository.deliveryVehicle(params);
}

class DeliveryVehicleParams extends Equatable {
  final int vehicleID;
  final String vehicleNumber;
  final List<File> vehicleLicense;
  final List<File> drivingLicense;

  const DeliveryVehicleParams({
    required this.vehicleID,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.drivingLicense,
  });

  Map<String, dynamic> toJson() => {
        'vehicle_id': vehicleID,
        'vehicle_number': vehicleNumber,
        'vehicle_license[]': vehicleLicense
            .map((e) => MultipartFile.fromFileSync(e.path))
            .toList(),
        'driving_license[]': drivingLicense
            .map((e) => MultipartFile.fromFileSync(e.path))
            .toList(),
        'terms': 1
      };

  @override
  List<Object?> get props =>
      [vehicleID, vehicleNumber, vehicleLicense, drivingLicense];
}
