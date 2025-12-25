import 'package:equatable/equatable.dart';
import 'package:wasli/src/shared/common/domain/entity/gender_enum.dart';

import '../../../../../core/core.dart';
import '../../../../../material/inputs/intel_phone/phone_field.dart';
import '../../data/models/api_user_model.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String? fName;
  final String? lName;
  final PhoneEntity mobile;
  final PhoneEntity whatsApp;
  final String? image;
  final bool isVerified;
  final double? lat;
  final double? lng;
  final GenderEnum? gender;

  const UserEntity(
      {required this.id,
      required this.name,
      required this.mobile,
      required this.whatsApp,
      required this.image,
      required this.isVerified,
      required this.lat,
      required this.lng,
      required this.gender,
      this.fName,
      this.lName});

  CacheUserEntity get mapToCacheEntity {
    return CacheUserEntity(
        id: id,
        name: name,
        avatar: image,
        mobile: mobile,
        whatsApp: whatsApp,
        gender: gender?.name,
        fName: fName,
        lName: lName);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        mobile,
        image,
        isVerified,
        whatsApp,
        lat,
        lng,
        gender,
        fName,
        lName
      ];
}

class PhoneEntity extends Equatable {
  final String phone;
  final String code;
  final String isoCode;

  const PhoneEntity({
    required this.phone,
    required this.code,
    required this.isoCode,
  });
  String get numberWithoutZero => phone.replaceFirst(RegExp(r'^0+'), '');
  String get numberWithZeroIfNot => phone.startsWith('0') ? phone : '0$phone';

  PhoneEntity get getPhoneEntity => PhoneEntity(
        code: code,
        phone: numberWithoutZero,
        isoCode: isoCode,
      );

  IntelPhoneNumberEntity get getFieldPhoneNumber => IntelPhoneNumberEntity(
        number: phone,
        countryISOCode: isoCode,
        countryCode: code,
      );

  Map<String, dynamic> get toMap => {
        kMobileCountryCodeAttributeCacheKey: code,
        kPhoneAttributeCacheKey: phone,
        kCountryIsoCodeAttributeCacheKey: isoCode,
      };

  @override
  List<Object?> get props => [
        phone,
        code,
        isoCode,
      ];
}
