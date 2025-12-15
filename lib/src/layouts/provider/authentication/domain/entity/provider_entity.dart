import 'package:equatable/equatable.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

class ProviderEntity extends Equatable {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final PhoneEntity mobile;
  final PhoneEntity whatsApp;
  final String? image;
  final String lastLogin;
  final int loginCount;
  final bool isVerified;
  final StoreDataEntity? storeData;
  final StoreAddressEntity? storeAddress;

  const ProviderEntity({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.whatsApp,
    required this.image,
    required this.lastLogin,
    required this.loginCount,
    required this.isVerified,
    required this.storeData,
    required this.storeAddress,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        firstName,
        lastName,
        email,
        mobile,
        whatsApp,
        image,
        lastLogin,
        loginCount,
        isVerified,
        storeData,
        storeAddress,
      ];
}

class StoreDataEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String email;
  final String description;
  final String image;
  final String commercialRegister;
  final double? managementCommission;
  final int categoryId;
  final CategoryEntity category;
  final List<CategoryEntity> subCategories;
  final List<StorePhoneEntity> phones;

  const StoreDataEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.description,
    required this.image,
    required this.commercialRegister,
    required this.managementCommission,
    required this.categoryId,
    required this.category,
    required this.subCategories,
    required this.phones,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        email,
        description,
        image,
        commercialRegister,
        managementCommission,
        categoryId,
        category,
        subCategories,
        phones,
      ];
}



class StorePhoneEntity extends Equatable {
  final int id;
  final int storeDataId;
  final String phone;

  const StorePhoneEntity({
    required this.id,
    required this.storeDataId,
    required this.phone,
  });

  @override
  List<Object?> get props => [id, storeDataId, phone];
}

class StoreAddressEntity extends Equatable {
  final int id;
  final int userId;
  final int countryId;
  final int areaId;
  final int cityId;
  final String address;
  final String lat;
  final String lng;
  final CommonEntity country;
  final CommonEntity area;
  final CommonEntity city;

  const StoreAddressEntity({
    required this.id,
    required this.userId,
    required this.countryId,
    required this.areaId,
    required this.cityId,
    required this.address,
    required this.lat,
    required this.lng,
    required this.country,
    required this.area,
    required this.city,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        countryId,
        areaId,
        cityId,
        address,
        lat,
        lng,
        country,
        area,
        city,
      ];
}

class LocationEntity extends Equatable {
  final int id;
  final String name;
  final String nameAr;
  final String nameEn;
  final String createdAt;

  const LocationEntity({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, nameAr, nameEn, createdAt];
}
