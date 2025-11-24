import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_state.dart';

class ProviderRegisterCubit extends Cubit<ProviderRegisterState> {
  ProviderRegisterCubit() : super(const ProviderRegisterState());

  final firstStepFormKey = GlobalKey<FormState>();
  final secondStepFormKey = GlobalKey<FormState>();
  final thirdStepFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeEmailController = TextEditingController();
  TextEditingController storeDescriptionController = TextEditingController();
  TextEditingController addressDescription = TextEditingController();
  TextEditingController addressDescriptionController = TextEditingController();
  IntelPhoneNumberEntity? phoneNumber;
  IntelPhoneNumberEntity? whatsAppPhoneNumber;
  IntelPhoneNumberEntity? storePhoneNumber;
  bool isTermsAndConditionsAccepted = false;
  File? storeImage;
  File? commercialRegisterIamge;
  String? mainCategory;
  String? subCategory;
  String? country;
  String? region;
  String? city;

  void changePhoneNumber(IntelPhoneNumberEntity? phoneNumber) {
    this.phoneNumber = phoneNumber;
    emit(state);
  }

  void changeWhatsAppPhoneNumber(IntelPhoneNumberEntity? whatsAppPhoneNumber) {
    this.whatsAppPhoneNumber = whatsAppPhoneNumber;
    emit(state);
  }

  void changeStorePhoneNumber(IntelPhoneNumberEntity? storePhoneNumber) {
    this.storePhoneNumber = storePhoneNumber;
    emit(state);
  }

  void changeStoreImage(File? image) {
    storeImage = image;
    emit(state);
  }

  void changeCommercialRegisterIamge(File? image) {
    commercialRegisterIamge = image;
    emit(state);
  }

  void changeMainCategory(String? mainCategory) {
    this.mainCategory = mainCategory;
    emit(state);
  }

  void changeSubCategory(String? subCategory) {
    this.subCategory = subCategory;
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
  void emit(ProviderRegisterState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    storeNameController.dispose();
    storeEmailController.dispose();
    storeDescriptionController.dispose();
    addressDescription.dispose();
    addressDescriptionController.dispose();

    return super.close();
  }
}
