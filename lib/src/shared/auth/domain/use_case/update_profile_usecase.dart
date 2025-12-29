import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/gender_enum.dart';

import '../repository/authentication_repository.dart';

@LazySingleton()
class UpdateProfileUseCase extends IUseCase<Unit, UpdateProfileParams> {
  final AuthenticationRepository repository;

  UpdateProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(UpdateProfileParams countryId) async {
    return await repository.updateProfile(countryId);
  }
}

class UpdateProfileParams {
  final String name;
  final File? image;
  final String? phone;
  final String? codeMobile;
  final String whatsapp;
  final String codeWhatsapp;
  final GenderEnum? gender;

  UpdateProfileParams({
    required this.name,
    this.image,
    this.phone,
    this.codeMobile,
    required this.whatsapp,
    required this.codeWhatsapp,
    this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      if (image != null) "image": MultipartFile.fromFileSync(image!.path),
      if (phone != null) "phone": phone,
      if (codeMobile != null) "code_mobile": codeMobile,
      "whatsapp": whatsapp,
      "code_whatsapp": codeWhatsapp,
      if (gender != null) "gender": gender!.name,
    };
  }
}
