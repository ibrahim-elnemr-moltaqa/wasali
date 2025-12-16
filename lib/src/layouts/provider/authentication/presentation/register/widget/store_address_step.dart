import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_address_params.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/provider_authentication_cubit/store_address/store_address_cubit.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/register/widget/your_location_on_map_widget.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/accept_terms_tile.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/areas/areas_drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/cities/cities_drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/countries/countries_drop_down.dart';

class StoreAddressStep extends StatefulWidget {
  const StoreAddressStep({super.key, this.phoneNumber});
  final IntelPhoneNumberEntity? phoneNumber;

  @override
  State<StoreAddressStep> createState() => _StoreAddressStepState();
}

class _StoreAddressStepState extends State<StoreAddressStep> {
  TextEditingController addressDescriptionController = TextEditingController();
  ValueNotifier<int?> countryId = ValueNotifier(null);
  ValueNotifier<int?> areaId = ValueNotifier(null);
  ValueNotifier<int?> cityId = ValueNotifier(null);
  ValueNotifier<LatLng?> latLng = ValueNotifier(null);
  ValueNotifier<bool> isTermsAndConditionsAccepted = ValueNotifier(false);
  GlobalKey<FormState> thirdStepFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    addressDescriptionController.dispose();
    countryId.dispose();
    areaId.dispose();
    cityId.dispose();
    isTermsAndConditionsAccepted.dispose();

    super.dispose();
  }

  void onRegisterStoreAddress(BuildContext context) {
    if (thirdStepFormKey.currentState?.validate() ?? false) {
      final StoreAddressCubit cubit = context.read<StoreAddressCubit>();
      cubit.providerStoreAddress(
        StoreAddressParams(
          address: addressDescriptionController.text,
          lat: latLng.value?.latitude.toString(),
          lng: latLng.value?.longitude.toString(),
          countryId: countryId.value!,
          cityId: cityId.value!,
          areaId: areaId.value!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreAddressCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: thirdStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: countryId,
                    builder: (context, value, child) {
                      return CountriesDropDown(
                        onChanged: (value) {
                          countryId.value = value?.id;
                        },
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: areaId,
                    builder: (context, value, child) {
                      return AreasDropDown(
                        onChanged: (value) => areaId.value = value?.id,
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: cityId,
                    builder: (context, value, child) {
                      return CitiesDropDown(
                        onChanged: (value) => cityId.value = value?.id,
                      );
                    }),
                AppTextFormField(
                  controller: addressDescriptionController,
                  hintText: appLocalizer.address_details,
                  label: appLocalizer.address_details,
                  maxLines: 2,
                  minLines: 2,
                  validate: (text) => Validator(text).defaultValidator,
                ),
                const SizedBox(height: 6),
                ValueListenableBuilder(
                    valueListenable: latLng,
                    builder: (context, value, child) {
                      return YourLocationOnMapWidget(
                        onLocationChanged: (address) {
                          latLng.value = LatLng(address.lat, address.long);
                        },
                      );
                    }),
                const SizedBox(height: 12),
                ValueListenableBuilder(
                    valueListenable: isTermsAndConditionsAccepted,
                    builder: (context, value, child) {
                      return AcceptTermsAndConditionsWidget(
                          isAccepted: isTermsAndConditionsAccepted.value,
                          onChanged: (isAccepted) {
                            isTermsAndConditionsAccepted.value = isAccepted;
                          });
                    }),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<StoreAddressCubit, Async>(
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
                    onRegisterStoreAddress(context);
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
