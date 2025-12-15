import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';

@Injectable()
class ProviderRegisterStoreDataUseCase extends IUseCase<Unit, StoreDataParams> {
  final ProviderAuthenticationRepository providerRegisterRepository;

  ProviderRegisterStoreDataUseCase(this.providerRegisterRepository);
  @override
  Future<Either<Failure, Unit>> call(StoreDataParams params) async {
    return await providerRegisterRepository
        .providerRegisterStoreInformations(params);
  }
}

class StoreDataParams extends Equatable {
  final File image;
  final String name;
  final String phone;
  final String email;
  final String description;
  final int categoryId;
  final List<int> subCategoryIds;
  final File commercialImage;
  final bool isUpdate;

  const StoreDataParams({
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
    required this.description,
    required this.categoryId,
    required this.subCategoryIds,
    required this.commercialImage,
    this.isUpdate = false,
  });

  Map<String, dynamic> toJson() => {
        'image': MultipartFile.fromFileSync(image.path),
        'name': name,
        'phone': '0$phone',
        'email': email,
        'description': description,
        'category_id': categoryId,
        'sub_category_ids[]': subCategoryIds,
        'commercial_register': MultipartFile.fromFileSync(commercialImage.path),
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
