import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/register/domain/repository/delivery_register_repository.dart';

@injectable
class DeliveryRegisterUseCase extends IUseCase<Unit, DeliveryRegisterParams> {
  final DeliveryRegisterRepository _deliveryRegisterRepository;

  DeliveryRegisterUseCase(this._deliveryRegisterRepository);

  @override
  DomainServiceType<Unit> call(DeliveryRegisterParams params) async {
    return await _deliveryRegisterRepository.deliveryRegister(params);
  }
}

class DeliveryRegisterParams extends Equatable {
  final String fName;
  final String lName;
  final String mobile;
  final String whatsApp;
  final File image;

  const DeliveryRegisterParams({
    required this.fName,
    required this.lName,
    required this.mobile,
    required this.whatsApp,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'first_name': fName,
        'last_name': lName,
        'mobile': '0$mobile',
        'whatsapp': '0$whatsApp',
        'image': MultipartFile.fromFileSync(image.path),
        'terms': 1
      };

  @override
  List<Object?> get props => [fName, lName, mobile, whatsApp, image];
}
