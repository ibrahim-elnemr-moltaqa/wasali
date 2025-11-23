import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_cubit.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_state.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/accept_terms_tile.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class StoreAddressStep extends StatelessWidget {
  const StoreAddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderRegisterCubit, ProviderRegisterState>(
      builder: (context, state) {
        final cubit = context.read<ProviderRegisterCubit>();
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
                  title: appLocalizer.country,
                  hint: appLocalizer.selectCountry,
                ),
                AppSingleDropDown(
                  value: null,
                  itemDisplay: (itemDisplay) => itemDisplay,
                  items: const ['car1', 'car2', 'car3', 'car4', 'car5'],
                  onChanged: (value) {},
                  borderRadius: 10,
                  title: appLocalizer.region,
                  hint: appLocalizer.choose_region,
                ),
                AppSingleDropDown(
                  value: null,
                  itemDisplay: (itemDisplay) => itemDisplay,
                  items: const ['car1', 'car2', 'car3', 'car4', 'car5'],
                  onChanged: (value) {},
                  borderRadius: 10,
                  title: appLocalizer.city,
                  hint: appLocalizer.choose_city,
                ),
                AppTextFormField(
                  controller: cubit.addressDescriptionController,
                  hintText: appLocalizer.address_details,
                  label: appLocalizer.address_details,
                  maxLines: 2,
                  minLines: 2,
                  validate: (text) => Validator(text).defaultValidator,
                ),
                const SizedBox(height: 6),
                DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: AppImage(
                              path: AppImages.map,
                              fit: BoxFit.fill,
                            )))
                    .setTitle(title: appLocalizer.your_location_on_map)
                    .onTapScaleAnimation(onTap: () {
                  AppRouter.pushNamed(AppRoutes.mapPage);
                }),
                const SizedBox(height: 12),
                AcceptTermsAndConditionsWidget(
                    isAccepted: cubit.isTermsAndConditionsAccepted,
                    onChanged: (isAccepted) {
                      cubit.onTermsAndConditionsChanged(isAccepted);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
