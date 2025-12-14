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
  Future<Either<Failure, Unit>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String name;
  final File? image;
  final String? phone;
  final String whatsapp;
  final GenderEnum? gender;

  UpdateProfileParams({
    required this.name,
    this.image,
    this.phone,
    required this.whatsapp,
    this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      if (image != null) "image": MultipartFile.fromFileSync(image!.path),
      if (phone != null) "phone": phone,
      "whatsapp": whatsapp,
      if (gender != null) "gender": gender!.name,
    };
  }
}
