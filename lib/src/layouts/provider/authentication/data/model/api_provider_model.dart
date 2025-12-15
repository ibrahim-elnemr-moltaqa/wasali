import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/shared/auth/data/models/api_user_model.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

class ApiProviderModel extends ProviderEntity {
  const ApiProviderModel({
    required super.id,
    required super.name,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.mobile,
    required super.whatsApp,
    required super.image,
    required super.lastLogin,
    required super.loginCount,
    required super.isVerified,
    required super.storeData,
    required super.storeAddress,
  });

  factory ApiProviderModel.fromJson(Map<String, dynamic> json) {
    return ApiProviderModel(
      id: json["id"],
      name: json["name"] ?? '',
      firstName: json["first_name"] ?? '',
      lastName: json["last_name"] ?? '',
      email: json["email"] ?? '',
      mobile: PhoneModel.fromMap(json),
      whatsApp: PhoneModel.fromMap(json, isWhatsApp: true),
      image: json["image"],
      lastLogin: json["last_login"] ?? '',
      loginCount: json["login_count"] ?? 0,
      isVerified: json["is_verified"] ?? false,
      storeData: json["strore_data"] != null
          ? StoreDataModel.fromJson(json["strore_data"])
          : null,
      storeAddress: json["strore_address"] != null
          ? StoreAddressModel.fromJson(json["strore_address"])
          : null,
    );
  }
}

class StoreDataModel extends StoreDataEntity {
  const StoreDataModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.email,
    required super.description,
    required super.image,
    required super.commercialRegister,
    required super.managementCommission,
    required super.categoryId,
    required super.category,
    required super.subCategories,
    required super.phones,
  });

  factory StoreDataModel.fromJson(Map<String, dynamic> json) {
    return StoreDataModel(
      id: json["id"],
      userId: json["user_id"],
      name: json["name"] ?? '',
      email: json["email"] ?? '',
      description: json["description"] ?? '',
      image: json["image"] ?? '',
      commercialRegister: json["commercial_register"] ?? '',
      managementCommission: json["managment_commission"] != null
          ? double.tryParse(json["managment_commission"].toString())
          : null,
      categoryId: json["category_id"],
      category: CategoryEntity.fromJson(json["category"]),
      subCategories: (json["sub_categories"] as List<dynamic>?)
              ?.map((e) => CategoryEntity.fromJson(e))
              .toList() ??
          [],
      phones: (json["phone"] as List<dynamic>?)
              ?.map((e) => StorePhoneModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class StorePhoneModel extends StorePhoneEntity {
  const StorePhoneModel({
    required super.id,
    required super.storeDataId,
    required super.phone,
  });

  factory StorePhoneModel.fromJson(Map<String, dynamic> json) {
    return StorePhoneModel(
      id: json["id"],
      storeDataId: json["store_data_id"],
      phone: json["phone"] ?? '',
    );
  }
}

class StoreAddressModel extends StoreAddressEntity {
  const StoreAddressModel({
    required super.id,
    required super.userId,
    required super.countryId,
    required super.areaId,
    required super.cityId,
    required super.address,
    required super.lat,
    required super.lng,
    required super.country,
    required super.area,
    required super.city,
  });

  factory StoreAddressModel.fromJson(Map<String, dynamic> json) {
    return StoreAddressModel(
      id: json["id"],
      userId: json["user_id"],
      countryId: json["country_id"],
      areaId: json["area_id"],
      cityId: json["city_id"],
      address: json["address"] ?? '',
      lat: json["lat"] ?? '',
      lng: json["lng"] ?? '',
      country: CommonEntity.fromJson(json["country"]),
      area: CommonEntity.fromJson(json["area"]),
      city: CommonEntity.fromJson(json["city"]),
    );
  }
}
