import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_vehicle_data_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/delivery_cubit/delivery_cubit.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/vehicle_data_cubit.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/vehicles/vehicle_drop_down.dart';

class DeliveryUpdateVehicleDataPage extends StatefulWidget {
  const DeliveryUpdateVehicleDataPage({super.key});

  @override
  State<DeliveryUpdateVehicleDataPage> createState() =>
      _DeliveryUpdateVehicleDataPageState();
}

class _DeliveryUpdateVehicleDataPageState
    extends State<DeliveryUpdateVehicleDataPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ValueNotifier<CommonEntity?> vehicle = ValueNotifier(null);
  TextEditingController vehicleNumberController = TextEditingController();
  ValueNotifier<List<File>> vehicleImages = ValueNotifier([]);
  ValueNotifier<List<File>> drivingLicenseImages = ValueNotifier([]);
  List<AttachmentEntity> apiVehicleImagesList = [];
  List<AttachmentEntity> apiDrivingLicenseImagesList = [];

  @override
  void dispose() {
    vehicle.dispose();
    vehicleNumberController.dispose();
    vehicleImages.dispose();
    drivingLicenseImages.dispose();
    super.dispose();
  }

  void setImage({
    required ValueNotifier<List<File>> notifier,
    required int index,
    required File file,
  }) {
    final images = List<File>.from(notifier.value);

    while (images.length <= index) {
      images.add(file);
    }

    images[index] = file;
    notifier.value = images;
  }

  String? safePath(List<AttachmentEntity> list, int index) {
    if (list.length > index) {
      return list[index].path;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryCubit()..getDelivery(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton()
              .setBorder(
                radius: 12,
              )
              .paddingAll(8),
          title: Text(appLocalizer.vehicle_data),
          centerTitle: false,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<DeliveryCubit, DeliveryState>(
              listenWhen: (previous, current) =>
                  previous.deleteImageState != current.deleteImageState,
              listener: (context, state) {
                if (state.deleteImageState.isSuccess) {
                  AppToasts.success(context,
                      message: appLocalizer.profileUpdateSuccessMessage);
                  context.read<DeliveryCubit>().getDelivery();
                } else if (state.deleteImageState.isFailure) {
                  AppToasts.error(context,
                      message: state.deleteImageState.errorMessage ?? '');
                }
              },
            ),
          ],
          child: BlocBuilder<DeliveryCubit, DeliveryState>(
            builder: (context, state) {
              return HandleResponseWidget(
                  status: state.deliveryState,
                  onRetry: () => context.read<DeliveryCubit>().getDelivery(),
                  onSuccess: (data) {
                    final delivery = data as DeliveryUserEntity;
                    vehicle.value = delivery.vehicleData.vehicle;
                    vehicleNumberController.text =
                        delivery.vehicleData.vehicleNumber;
                    apiVehicleImagesList = delivery.vehicleData.vehicleLicense;
                    apiDrivingLicenseImagesList =
                        delivery.vehicleData.drivingLicense;
                    return SafeArea(
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: vehicle,
                                  builder: (context, value, child) {
                                    return VehiclesDropDown(
                                      vehicle: value,
                                      onChanged: (value) {
                                        vehicle.value = value;
                                      },
                                    );
                                  }),
                              AppTextFormField(
                                controller: vehicleNumberController,
                                inputType: TextInputType.number,
                                label: appLocalizer.vehicle_plate_number,
                                hintText:
                                    appLocalizer.enter_vehicle_plate_number,
                                validate: (text) =>
                                    Validator(text).defaultValidator,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: DottedUploadImageWidget(
                                      initialValue:
                                          safePath(apiVehicleImagesList, 0),
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
                                      onDelete: () {
                                        final imageId = apiVehicleImagesList
                                            .firstOrNull?.id;
                                        if (imageId != null) {
                                          context
                                              .read<DeliveryCubit>()
                                              .deleteImage(
                                                  imageId, 'vehicle_license');
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: DottedUploadImageWidget(
                                      initialValue:
                                          safePath(apiVehicleImagesList, 1),
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
                                      onDelete: () {
                                        final imageId = apiVehicleImagesList
                                            .indexed
                                            .firstWhere(
                                                (element) => element.$1 == 1,
                                                orElse: () => (
                                                      -1,
                                                      const AttachmentEntity
                                                          .empty()
                                                    ))
                                            .$2
                                            .id;
                                        if (imageId != 0) {
                                          context
                                              .read<DeliveryCubit>()
                                              .deleteImage(
                                                  imageId, 'vehicle_license');
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
                                      initialValue: safePath(
                                          apiDrivingLicenseImagesList, 0),
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
                                      onDelete: () {
                                        final imageId =
                                            apiDrivingLicenseImagesList
                                                .firstOrNull?.id;
                                        if (imageId != null) {
                                          context
                                              .read<DeliveryCubit>()
                                              .deleteImage(
                                                  imageId, 'driving_license');
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: DottedUploadImageWidget(
                                      initialValue: safePath(
                                          apiDrivingLicenseImagesList, 1),
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
                                      onDelete: () {
                                        final imageId =
                                            apiDrivingLicenseImagesList.indexed
                                                .firstWhere(
                                                    (element) =>
                                                        element.$1 == 1,
                                                    orElse: () => (
                                                          -1,
                                                          const AttachmentEntity
                                                              .empty()
                                                        ))
                                                .$2
                                                .id;
                                        if (imageId != 0) {
                                          context
                                              .read<DeliveryCubit>()
                                              .deleteImage(
                                                  imageId, 'driving_license');
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
                              BlocProvider(
                                create: (context) => VehicleDataCubit(),
                                child: BlocConsumer<VehicleDataCubit, Async>(
                                  listener: (context, state) {
                                    if (state.isSuccess) {
                                      AppAuthenticationBloc.of(context)
                                          .add(AuthenticatedEvent());
                                      AppToasts.success(context,
                                          message: appLocalizer
                                              .profileUpdateSuccessMessage);
                                    } else if (state.isFailure) {
                                      AppToasts.error(context,
                                          message: state.errorMessage ?? '');
                                    }
                                  },
                                  builder: (context, state) {
                                    return AppButton(
                                        isLoading: state.isLoading,
                                        text: appLocalizer.save,
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            final params =
                                                DeliveryVehicleParams(
                                              isUpdate: true,
                                              vehicleID: vehicle.value!.id,
                                              vehicleNumber:
                                                  vehicleNumberController.text,
                                              vehicleLicense:
                                                  vehicleImages.value,
                                              drivingLicense:
                                                  drivingLicenseImages.value,
                                            );
                                            context
                                                .read<VehicleDataCubit>()
                                                .vehicleData(params);
                                          }
                                        });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ).paddingHorizontal(20),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
