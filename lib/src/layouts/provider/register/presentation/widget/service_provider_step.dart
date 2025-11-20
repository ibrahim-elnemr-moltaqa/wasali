import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_cubit.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_state.dart';

class ServiceProviderStep extends StatelessWidget {
  const ServiceProviderStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderRegisterCubit, ProviderRegisterState>(
      builder: (context, state) {
        final cubit = context.read<ProviderRegisterCubit>();
        return Form(
          key: cubit.firstStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NameField(
                  controller: cubit.nameController,
                  hint: appLocalizer.enterName,
                  label: appLocalizer.name,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
