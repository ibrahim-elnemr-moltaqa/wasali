import '../../../../../material/inputs/intel_phone/phone_field.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/core.dart';
import '../../data/models/api_user_model.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final PhoneEntity mobile;
  final String? image;
  final bool isVerified;
  final String? email;
  final double? lat;
  final double? lng;

  const UserEntity({
    required this.id,
    required this.name,
    required this.mobile,
    required this.image,
    required this.isVerified,
    required this.email,
    required this.lat,
    required this.lng,
  });

  CacheUserEntity get mapToCacheEntity {
    return CacheUserEntity(
      id: id,
      name: name,
      avatar: image,
      mobile: mobile,
      email: email,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        mobile,
        image,
        isVerified,
        email,
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

  PhoneEntity get getPhoneEntity => PhoneEntity(
        code: code,
        phone: numberWithoutZero,
        isoCode: isoCode,
      );
      
  Map<String, dynamic> get toMap => {
        kCountryCodeAttributeCacheKey: code,
        kPhoneAttributeCacheKey: phone,
        kCountryIsoCodeAttributeCacheKey: isoCode,
      };

  @override
  List<Object?> get props => [
        phone,
        code,
        isoCode,
      ];

  IntelPhoneNumberEntity toIntelPhoneEntity() {
    return IntelPhoneNumberEntity(
      number: phone,
      countryCode: code,
      countryISOCode: isoCode,
    );
  }
}
