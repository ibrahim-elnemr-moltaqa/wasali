import 'dart:convert';

import 'package:wasli/src/shared/common/domain/entity/gender_enum.dart';

import '../../domain/entities/user_entity.dart';

class ApiUserModel extends UserEntity {
  const ApiUserModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.whatsApp,
    required super.image,
    required super.isVerified,
    required super.lat,
    required super.lng,
    super.gender,
    super.fName,
    super.lName,
  });
  factory ApiUserModel.example() => const ApiUserModel(
      id: 0,
      name: "name",
      mobile: PhoneModel(
        phone: "01000000000",
        code: "01",
        isoCode: "EG",
      ),
      whatsApp: PhoneModel(
        phone: "01000000000",
        code: "01",
        isoCode: "EG",
      ),
      image: "image",
      isVerified: false,
      lng: 41.12,
      lat: 156.1,
      gender: GenderEnum.male);
  factory ApiUserModel.fromJson(Map<String, dynamic> json) => ApiUserModel(
        id: json["id"],
        name: json["name"] ?? '',
        mobile: PhoneModel.fromMap(json['mobileCode']),
        whatsApp: PhoneModel.fromMap(json['whatsappCode'], isWhatsApp: true),
        image: json["image"],
        isVerified: json["is_verified"],
        lat: double.tryParse(json["lat"] ?? "0"),
        lng: double.tryParse(json["lng"] ?? "0"),
        gender: json["gender"] == null
            ? null
            : GenderEnum.fromApiValue(json["gender"]),
        fName: json["first_name"],
        lName: json["last_name"],
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

  factory PhoneModel.fromMap(Map<String, dynamic> map,
      {bool isWhatsApp = false}) {
    return PhoneModel(
        phone: map[
            isWhatsApp ? kWhatsAppAttributeCacheKey : kPhoneAttributeCacheKey],
        code: map[kMobileCountryCodeAttributeCacheKey],
        isoCode: "SA");
  }

  String get toJson => json.encode(toMap);
}

const String kPhoneAttributeCacheKey = 'mobile';
const String kWhatsAppAttributeCacheKey = 'whatsapp';
const String kMobileCountryCodeAttributeCacheKey = 'country_code';
const String kCountryIsoCodeAttributeCacheKey = 'iso_code';
