import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/avatar_widget.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_cubit.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_state.dart';

class DeliveryRegisterInitialDataStep extends StatelessWidget {
  const DeliveryRegisterInitialDataStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRegisterCubit, DeliveryRegisterState>(
      builder: (context, state) {
        final cubit = context.read<DeliveryRegisterCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.firstStepFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AvatarWidget(
                    onPickImage: (image) {
                      cubit.changeProfileImage(image);
                    },
                    onDeleteImage: () {
                      cubit.deleteProfileImage();
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NameField(
                          controller: cubit.firstNameController,
                          hint: appLocalizer.enterName,
                          label: appLocalizer.first_name,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: NameField(
                          controller: cubit.lastNameController,
                          hint: appLocalizer.enterName,
                          label: appLocalizer.last_name,
                          
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  IntelPhoneField(
                    initialValue: cubit.phoneNumber,
                    label: appLocalizer.phoneNumber,
                    onChange: cubit.changePhoneNumber,
                    hint: appLocalizer.enterPhoneNumber,
                  ),
                  const SizedBox(height: 12),
                  IntelPhoneField(
                    initialValue: cubit.whatsAppPhoneNumber,
                    label: appLocalizer.whatsApp_number,
                    onChange: cubit.changeWhatsAppPhoneNumber,
                    hint: appLocalizer.enter_whatsapp_number,
                  ),
                  const SizedBox(height: 16),
                ]),
          ),
        );
      },
    );
  }
}
