import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';


class DeliveryUserEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final AttachmentEntity image;
  final PhoneEntity mobile;
  final PhoneEntity whatsapp;
  final DateTime lastLogin;
  final int loginCount;
  final String lang;
  final String birthday;
  final String gender;
  final int notificationStatus;
  final bool isActive;
  final bool isVerified;
  final DeliveryBankInfoEntity? deliveryBankInfo;
  final VehicleDataEntity? vehicleData;

  const DeliveryUserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.mobile,
    required this.whatsapp,
    required this.lastLogin,
    required this.loginCount,
    required this.lang,
    required this.birthday,
    required this.gender,
    required this.notificationStatus,
    required this.isActive,
    required this.isVerified,
    required this.deliveryBankInfo,
    required this.vehicleData,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        image,
        mobile,
        whatsapp,
        lastLogin,
        loginCount,
        lang,
        birthday,
        gender,
        notificationStatus,
        isActive,
        isVerified,
        deliveryBankInfo,
        vehicleData,
      ];
}

class DeliveryBankInfoEntity extends Equatable {
  final int id;
  final int userId;
  final int bankId;
  final String iban;
  final String accountNumber;
  final String nationalId;
  final CommonEntity bank;

  const DeliveryBankInfoEntity({
    required this.id,
    required this.userId,
    required this.bankId,
    required this.iban,
    required this.accountNumber,
    required this.nationalId,
    required this.bank,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        bankId,
        iban,
        accountNumber,
        nationalId,
        bank,
      ];
}

class VehicleDataEntity extends Equatable {
  final int id;
  final int userId;
  final int vehicleId;
  final String vehicleNumber;
  final List<AttachmentEntity> vehicleLicense;
  final List<AttachmentEntity> drivingLicense;
  final CommonEntity vehicle;

  const VehicleDataEntity({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.drivingLicense,
    required this.vehicle,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        vehicleId,
        vehicleNumber,
        vehicleLicense,
        drivingLicense,
        vehicle,
      ];
}