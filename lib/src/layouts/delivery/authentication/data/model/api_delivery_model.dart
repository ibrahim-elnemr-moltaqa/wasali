import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/shared/auth/data/models/api_user_model.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

class ApiDeliveryUserModel extends DeliveryUserEntity {
  const ApiDeliveryUserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.image,
    required super.mobile,
    required super.whatsapp,
    required super.lastLogin,
    required super.loginCount,
    required super.lang,
    required super.birthday,
    required super.gender,
    required super.notificationStatus,
    required super.isActive,
    required super.isVerified,
    required super.deliveryBankInfo,
    required super.vehicleData,
  });

  factory ApiDeliveryUserModel.fromJson(Map<String, dynamic> json) =>
      ApiDeliveryUserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: AttachmentEntity.fromNetwork(url: json["image"]),
        mobile: PhoneModel.fromMap(json["mobileCode"]),
        whatsapp: PhoneModel.fromMap(json["whatsappCode"], isWhatsApp: true),
        lastLogin: DateTime.parse(json["last_login"]),
        loginCount: json["login_count"],
        lang: json["lang"],
        birthday: json["birthday"] ?? "",
        gender: json["gender"],
        notificationStatus: json["notification_status"],
        isActive: json["is_active"],
        isVerified: json["is_verified"],
        deliveryBankInfo:
            ApiDeliveryBankInfoModel.fromJson(json["deliveryBankInfo"]),
        vehicleData: ApiVehicleDataModel.fromJson(json["vehicleData"]),
      );

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

class ApiDeliveryBankInfoModel extends DeliveryBankInfoEntity {
  const ApiDeliveryBankInfoModel({
    required super.id,
    required super.userId,
    required super.bankId,
    required super.iban,
    required super.accountNumber,
    required super.nationalId,
    required super.bank,
  });

  factory ApiDeliveryBankInfoModel.fromJson(Map<String, dynamic> json) =>
      ApiDeliveryBankInfoModel(
        id: json["id"],
        userId: json["user_id"],
        bankId: json["bank_id"],
        iban: json["iban"],
        accountNumber: json["account_number"],
        nationalId: json["national_id"],
        bank: CommonEntity.fromJson(json["bank"]),
      );

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

class ApiVehicleDataModel extends VehicleDataEntity {
  const ApiVehicleDataModel({
    required super.id,
    required super.userId,
    required super.vehicleId,
    required super.vehicleNumber,
    required super.vehicleLicense,
    required super.drivingLicense,
    required super.vehicle,
  });

  factory ApiVehicleDataModel.fromJson(Map<String, dynamic> json) =>
      ApiVehicleDataModel(
        id: json["id"],
        userId: json["user_id"],
        vehicleId: json["vehicle_id"],
        vehicleNumber: json["vehicle_number"],
        vehicleLicense: List<AttachmentEntity>.from(
          json["vehicle_license"].map(
            (x) => AttachmentEntity.fromNetwork(
              url: x["vehicle_license"],
              id: x["id"],
            ),
          ),
        ),
        drivingLicense: List<AttachmentEntity>.from(
          json["driving_license"].map(
            (x) => AttachmentEntity.fromNetwork(
              url: x["driving_license"],
              id: x["id"],
            ),
          ),
        ),
        vehicle: CommonEntity.fromJson(json["vehicle"]),
      );

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
