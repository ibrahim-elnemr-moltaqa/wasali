import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart'
    show IntelPhoneNumberEntity;
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_state.dart';

class DeliveryRegisterCubit extends Cubit<DeliveryRegisterState> {
  DeliveryRegisterCubit() : super(const DeliveryRegisterState());

  final firstStepFormKey = GlobalKey<FormState>();
  final secondStepFormKey = GlobalKey<FormState>();
  final thirdStepFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  IntelPhoneNumberEntity? phoneNumber;
  IntelPhoneNumberEntity? whatsAppPhoneNumber;
  File? profileImage;
  TextEditingController ibanController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  String? bankName;
  String? vehicleType;
  TextEditingController vehicleNumberController = TextEditingController();
  File? vehicleFrontImage;
  File? vehicleBackImage;
  File? drivingLicenseFrontImage;
  File? drivingLicenseBackImage;
  bool isTermsAndConditionsAccepted = false;

  void changeBankName(String? bankName) {
    this.bankName = bankName;
    emit(state);
  }

  void changeVehicleType(String? vehicleType) {
    this.vehicleType = vehicleType;
    emit(state);
  }

  void changeVechicleFrontImage(File? image) {
    vehicleFrontImage = image;
    emit(state);
  }

  void changeVechicleBackImage(File? image) {
    vehicleBackImage = image;
    emit(state);
  }

  void changeDrivingLicenseFrontImage(File? image) {
    drivingLicenseFrontImage = image;
    emit(state);
  }

  void changeDrivingLicenseBackImage(File? image) {
    drivingLicenseBackImage = image;
    emit(state);
  }

  void changeProfileImage(File? image) {
    profileImage = image;
    emit(state);
  }

  void deleteProfileImage() {
    profileImage = null;
    emit(state);
  }

  void changePhoneNumber(IntelPhoneNumberEntity? phoneNumber) {
    this.phoneNumber = phoneNumber;
    emit(state);
  }

  void changeWhatsAppPhoneNumber(IntelPhoneNumberEntity? whatsAppPhoneNumber) {
    this.whatsAppPhoneNumber = whatsAppPhoneNumber;
    emit(state);
  }

  bool validateCurrentStep(int step) {
    switch (step) {
      case 0:
        return (firstStepFormKey.currentState?.validate() ?? false);
      case 1:
        return (secondStepFormKey.currentState?.validate() ?? false);
      case 2:
        return (thirdStepFormKey.currentState?.validate() ?? false);
      default:
        return false;
    }
  }

  bool validateAllSteps() {
    return (firstStepFormKey.currentState?.validate() ?? false) &&
        (secondStepFormKey.currentState?.validate() ?? false) &&
        (thirdStepFormKey.currentState?.validate() ?? false);
  }

  void nextStep(int step) {
    if (!validateCurrentStep(step)) return;

    emit(state.copyWith(
      completedSteps: {
        ...state.completedSteps,
        step,
      },
    ));
  }

  void onTermsAndConditionsChanged(bool? value) {
    isTermsAndConditionsAccepted = value ?? false;
    emit(state.copyWith(
        isTermsAndConditionsAccepted: isTermsAndConditionsAccepted));
  }

  @override
  void emit(DeliveryRegisterState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
