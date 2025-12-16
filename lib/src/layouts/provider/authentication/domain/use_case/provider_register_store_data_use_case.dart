import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';

@Injectable()
class ProviderStoreDataUseCase extends IUseCase<Unit, StoreDataParams> {
  final ProviderAuthenticationRepository providerRegisterRepository;

  ProviderStoreDataUseCase(this.providerRegisterRepository);
  @override
  Future<Either<Failure, Unit>> call(StoreDataParams params) async {
    return await providerRegisterRepository
        .providerRegisterStoreInformations(params);
  }
}

class StoreDataParams extends Equatable {
  final File? image;
  final String? name;
  final String? phone;
  final List<String>? phones;
  final String? email;
  final String? description;
  final int? categoryId;
  final List<int>? subCategoryIds;
  final File? commercialImage;
  final bool isUpdate;

  const StoreDataParams({
    this.image,
    this.name,
    this.phone,
    this.phones,
    this.email,
    this.description,
    this.categoryId,
    this.subCategoryIds,
    this.commercialImage,
    this.isUpdate = false,
  });

  Map<String, dynamic> toJson() => {
        if (image != null) 'image': MultipartFile.fromFileSync(image!.path),
        if (name != null) 'name': name,
        if (phone != null) 'phone': '0$phone',
        if (phones != null) 'phones[]': phones?.map((e) => '0$e').toList(),
        if (email != null) 'email': email,
        if (description != null) 'description': description,
        if (categoryId != null) 'category_id': categoryId,
        if (subCategoryIds != null) 'sub_category_ids[]': subCategoryIds,
        if (commercialImage != null)
          'commercial_register':
              MultipartFile.fromFileSync(commercialImage!.path),
      };

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        description,
        categoryId,
        subCategoryIds,
        image,
        commercialImage,
        isUpdate
      ];
}
