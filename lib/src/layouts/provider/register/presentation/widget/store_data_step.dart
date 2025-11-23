import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/email_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_cubit.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_state.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class StoreDataStep extends StatelessWidget {
  const StoreDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderRegisterCubit, ProviderRegisterState>(
      builder: (context, state) {
        final cubit = context.read<ProviderRegisterCubit>();
        return Form(
          key: cubit.secondStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DottedUploadImageWidget(
                    title: appLocalizer.store_image,
                    onChanged: (image) {
                      cubit.changeStoreImage(image);
                    }),
                const SizedBox(height: 12),
                NameField(
                  label: appLocalizer.store_name,
                  hint: appLocalizer.store_name,
                  controller: cubit.storeNameController,
                ),
                IntelPhoneField(
                  initialValue: cubit.phoneNumber,
                  label: appLocalizer.phoneNumber,
                  onChange: cubit.changePhoneNumber,
                  hint: appLocalizer.enterPhoneNumber,
                ),
                EmailField(controller: cubit.storeEmailController),
                AppTextFormField(
                  label: appLocalizer.store_description,
                  hintText: appLocalizer.store_description,
                  controller: cubit.storeDescriptionController,
                  maxLines: 5,
                  maxLength: 300,
                  showCounter: true,
                ),
                DottedUploadImageWidget(
                    title: appLocalizer.commercial_register_image,
                    onChanged: (image) {
                      cubit.changeCommercialRegisterIamge(image);
                    }),
                AppSingleDropDown(
                  value: null,
                  itemDisplay: (itemDisplay) => itemDisplay,
                  items: const ['car1', 'car2', 'car3', 'car4', 'car5'],
                  onChanged: (value) {
                    cubit.changeMainCategory(value);
                  },
                  borderRadius: 10,
                  title: appLocalizer.main_category,
                  hint: appLocalizer.choose_main_category,
                ),
                AppSingleDropDown(
                  value: null,
                  itemDisplay: (itemDisplay) => itemDisplay,
                  items: const ['car1', 'car2', 'car3', 'car4', 'car5'],
                  onChanged: (value) {
                    cubit.changeSubCategory(value);
                  },
                  borderRadius: 10,
                  title: appLocalizer.sub_category,
                  hint: appLocalizer.choose_sub_category,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
