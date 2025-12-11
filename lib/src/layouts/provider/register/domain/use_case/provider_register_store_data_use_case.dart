import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/register/domain/repository/provider_register_repository.dart';

@Injectable()
class ProviderRegisterStoreDataUseCase extends IUseCase<Unit, StoreDataParams> {
  final ProviderRegisterRepository providerRegisterRepository;

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
  final List<int> subCategoryId;
  final File commercialImage;

  const StoreDataParams({
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
    required this.description,
    required this.categoryId,
    required this.subCategoryId,
    required this.commercialImage,
  });

  Map<String, dynamic> toJson() => {
        'image': MultipartFile.fromFileSync(image.path),
        'name': name,
        'phone': '0$phone',
        'email': email,
        'description': description,
        'category_id': categoryId,
        'subCategory_id': subCategoryId,
        'commercial_register': MultipartFile.fromFileSync(commercialImage.path),
      };

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        description,
        categoryId,
        subCategoryId,
        image,
        commercialImage
      ];
}
