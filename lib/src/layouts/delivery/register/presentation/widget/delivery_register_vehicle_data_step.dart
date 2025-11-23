import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_cubit.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_state.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/accept_terms_tile.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class DeliveryRegisterVehicleDataStep extends StatelessWidget {
  const DeliveryRegisterVehicleDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRegisterCubit, DeliveryRegisterState>(
      builder: (context, state) {
        final cubit = context.read<DeliveryRegisterCubit>();
        return Form(
          key: cubit.thirdStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSingleDropDown(
                  value: null,
                  itemDisplay: (itemDisplay) => itemDisplay,
                  items: const ['car1', 'car2', 'car3', 'car4', 'car5'],
                  onChanged: (value) {},
                  borderRadius: 10,
                  title: appLocalizer.vehicle_type,
                  hint: appLocalizer.choose_vehicle_type,
                ),
                AppTextFormField(
                  controller: cubit.vehicleNumberController,
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
                        onChanged: (file) {},
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: DottedUploadImageWidget(
                        title: appLocalizer.license_back,
                        onChanged: (file) {},
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
                        onChanged: (file) {},
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: DottedUploadImageWidget(
                        title: appLocalizer.license_back,
                        onChanged: (file) {},
                      ),
                    ),
                  ],
                ).setTitle(
                  title: appLocalizer.driving_license,
                ),
                const SizedBox(
                  height: 12,
                ),
                AcceptTermsAndConditionsWidget(
                    isAccepted: state.isTermsAndConditionsAccepted,
                    onChanged: cubit.onTermsAndConditionsChanged),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
