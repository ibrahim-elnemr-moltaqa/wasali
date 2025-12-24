import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart';
import 'package:wasli/src/shared/common/domain/entity/gender_enum.dart';

@injectable
class DeliveryMainInformationUseCase
    extends IUseCase<Unit, DeliveryMainInformationParams> {
  final DeliveryRegisterRepository _deliveryRegisterRepository;

  DeliveryMainInformationUseCase(this._deliveryRegisterRepository);

  @override
  DomainServiceType<Unit> call(DeliveryMainInformationParams params) async {
    return await _deliveryRegisterRepository.deliveryMainInformation(params);
  }
}

class DeliveryMainInformationParams extends Equatable {
  final String? fName;
  final String? lName;
  final String? mobile;
  final String? codeMobile;
  final String? whatsApp;
  final String? codeWhatsapp;
  final File? image;
  final GenderEnum? gender;
  final bool isUpdate;

  const DeliveryMainInformationParams({
    this.fName,
    this.lName,
    this.mobile,
    this.codeMobile,
    this.whatsApp,
    this.codeWhatsapp,
    this.image,
    this.gender,
    this.isUpdate = false,
  });

  Map<String, dynamic> toJson() => {
        if (fName != null) 'first_name': fName,
        if (lName != null) 'last_name': lName,
        if (mobile != null) 'mobile': '0$mobile',
        if (codeMobile != null) 'code_mobile': codeMobile,
        if (whatsApp != null) 'whatsapp': whatsApp,
        if (codeWhatsapp != null) 'code_whatsapp': codeWhatsapp,
        if (image != null) 'image': MultipartFile.fromFileSync(image!.path),
        if (gender != null) 'gender': gender!.name,
      };

  @override
  List<Object?> get props =>
      [fName, lName, mobile, whatsApp, image, gender, isUpdate];
}
