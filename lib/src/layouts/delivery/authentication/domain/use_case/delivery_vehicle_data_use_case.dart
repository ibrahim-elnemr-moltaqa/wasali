import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart';

@injectable
class DeliveryVehicleDataUseCase extends IUseCase<Unit, DeliveryVehicleParams> {
  final DeliveryAuthenticationRepository repository;

  DeliveryVehicleDataUseCase(this.repository);

  @override
  DomainServiceType<Unit> call(DeliveryVehicleParams params) async =>
      await repository.deliveryVehicleData(params);
}

class DeliveryVehicleParams extends Equatable {
  final int vehicleID;
  final String vehicleNumber;
  final List<File> vehicleLicense;
  final List<File> drivingLicense;
  final bool isUpdate;

  const DeliveryVehicleParams({
    required this.vehicleID,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.drivingLicense,
    this.isUpdate = false,
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
      [vehicleID, vehicleNumber, vehicleLicense, drivingLicense, isUpdate];
}
