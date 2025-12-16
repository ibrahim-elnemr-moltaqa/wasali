import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_vehicle_data_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/vehicle_data_cubit.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/accept_terms_tile.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/vehicles/vehicle_drop_down.dart';

class DeliveryRegisterVehicleDataStep extends StatefulWidget {
  const DeliveryRegisterVehicleDataStep({super.key, this.phoneNumber});
  final IntelPhoneNumberEntity? phoneNumber;

  @override
  State<DeliveryRegisterVehicleDataStep> createState() =>
      _DeliveryRegisterVehicleDataStepState();
}

class _DeliveryRegisterVehicleDataStepState
    extends State<DeliveryRegisterVehicleDataStep> {
  ValueNotifier<CommonEntity?> vehicle = ValueNotifier(null);
  TextEditingController vehicleNumberController = TextEditingController();
  ValueNotifier<List<File>> vehicleImages = ValueNotifier([]);
  ValueNotifier<List<File>> drivingLicenseImages = ValueNotifier([]);
  ValueNotifier<bool> isTermsAndConditionsAccepted = ValueNotifier(false);
  GlobalKey<FormState> thirdStepFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    vehicle.dispose();
    vehicleNumberController.dispose();
    vehicleImages.dispose();
    drivingLicenseImages.dispose();
    isTermsAndConditionsAccepted.dispose();
    super.dispose();
  }

  void onRegisterVehicleData(BuildContext context) {
    if (thirdStepFormKey.currentState!.validate()) {
      final params = DeliveryVehicleParams(
        vehicleID: vehicle.value!.id,
        vehicleNumber: vehicleNumberController.text,
        vehicleLicense: vehicleImages.value,
        drivingLicense: drivingLicenseImages.value,
      );
      context.read<VehicleDataCubit>().vehicleData(params);
    }
  }

  void setImage({
    required ValueNotifier<List<File>> notifier,
    required int index,
    required File file,
  }) {
    final images = List<File>.from(notifier.value);

    if (images.length > index) {
      images[index] = file;
    } else {
      while (images.length < index) {
        images.add(images.last);
      }
      images.add(file);
    }

    notifier.value = images;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleDataCubit(),
      child: Scaffold(
        body: Form(
          key: thirdStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: vehicle,
                    builder: (context, value, child) {
                      return VehiclesDropDown(
                        onChanged: (value) {
                          vehicle.value = value;
                        },
                      );
                    }),
                AppTextFormField(
                  controller: vehicleNumberController,
                  inputType: TextInputType.number,
                  label: appLocalizer.vehicle_plate_number,
                  hintText: appLocalizer.enter_vehicle_plate_number,
                  validate: (text) => Validator(text).defaultValidator,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedUploadImageWidget(
                        title: appLocalizer.license_front,
                        onChanged: (file) {
                          if (file != null) {
                            setImage(
                              notifier: vehicleImages,
                              index: 0,
                              file: file,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: DottedUploadImageWidget(
                        title: appLocalizer.license_back,
                        onChanged: (file) {
                          if (file != null) {
                            setImage(
                              notifier: vehicleImages,
                              index: 1,
                              file: file,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ).setTitle(
                  title: appLocalizer.vehicle_license,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedUploadImageWidget(
                        title: appLocalizer.license_front,
                        onChanged: (file) {
                          if (file != null) {
                            setImage(
                              notifier: drivingLicenseImages,
                              index: 0,
                              file: file,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: DottedUploadImageWidget(
                        title: appLocalizer.license_back,
                        onChanged: (file) {
                          if (file != null) {
                            setImage(
                              notifier: drivingLicenseImages,
                              index: 1,
                              file: file,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ).setTitle(
                  title: appLocalizer.driving_license,
                ),
                const SizedBox(
                  height: 12,
                ),
                ValueListenableBuilder(
                    valueListenable: isTermsAndConditionsAccepted,
                    builder: (context, value, child) {
                      return AcceptTermsAndConditionsWidget(
                          isAccepted: isTermsAndConditionsAccepted.value,
                          onChanged: (value) {
                            isTermsAndConditionsAccepted.value = value;
                          });
                    }),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<VehicleDataCubit, Async>(
          listener: (context, state) {
            if (state.isSuccess) {
              AppRouter.pushNamed(AppRoutes.otp,
                  arguments: OtpScreenArguments(
                    phone: widget.phoneNumber!,
                    caseEnum: OtpScreenCaseEnum.register,
                  ));
            } else if (state.isFailure) {
              AppToasts.error(context, message: state.errorMessage ?? '');
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  isLoading: state.isLoading,
                  text: appLocalizer.sendOTP,
                  onPressed: () {
                    onRegisterVehicleData(context);
                  },
                ),
              ],
            );
          },
        ).paddingBottom(16),
      ),
    );
  }
}
