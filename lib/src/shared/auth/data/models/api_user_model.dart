import 'dart:convert';

import '../../domain/entities/user_entity.dart';

class ApiUserModel extends UserEntity {
  const ApiUserModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.image,
    required super.isVerified,
    required super.email,
    required super.lat,
    required super.lng,
  });
  factory ApiUserModel.example() => const ApiUserModel(
        id: 0,
        name: "name",
        mobile: PhoneModel(
          phone: "01000000000",
          code: "01",
          isoCode: "EG",
        ),
        image: "image",
        isVerified: false,
        email: "email",
        lng: 41.12,
        lat: 156.1,
      );
  factory ApiUserModel.fromJson(Map<String, dynamic> json) => ApiUserModel(
        id: json["id"],
        name: json["name"] ?? '',
        mobile: PhoneModel.fromMap(json),
        image: json["image"],
        isVerified: json["is_verified"],
        email: json["email"],
        lat: double.tryParse(json["lat"] ?? "0"),
        lng: double.tryParse(json["lng"] ?? "0"),
      );
}

class PhoneModel extends PhoneEntity {
  const PhoneModel({
    required super.phone,
    required super.code,
    super.isoCode = "",
  });

  factory PhoneModel.fromJson(String tokenJson) {
    final Map<String, dynamic> encodedMap = json.decode(tokenJson);
    return PhoneModel.fromMap(encodedMap);
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      phone: map[kPhoneAttributeCacheKey],
      code: map[kCountryCodeAttributeCacheKey] ?? '+966', isoCode: "SA"
    
    );
  }

  String get toJson => json.encode(toMap);
}

const String kPhoneAttributeCacheKey = 'mobile';
const String kCountryCodeAttributeCacheKey = 'country_code';
const String kCountryIsoCodeAttributeCacheKey = 'iso_code';
