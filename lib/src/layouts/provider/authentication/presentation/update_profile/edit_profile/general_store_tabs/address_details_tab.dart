import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_address_params.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/provider_authentication_cubit/store_address/store_address_cubit.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/register/widget/your_location_on_map_widget.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/areas/areas_drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/cities/cities_drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/countries/countries_drop_down.dart';

class AddressDetailsTab extends StatefulWidget {
  const AddressDetailsTab({super.key, this.storeAddressEntity});
  final StoreAddressEntity? storeAddressEntity;

  @override
  State<AddressDetailsTab> createState() => _AddressDetailsTabState();
}

class _AddressDetailsTabState extends State<AddressDetailsTab> {
  TextEditingController addressDescriptionController = TextEditingController();
  late CommonEntity? country;
  late CommonEntity? area;
  late CommonEntity? city;
  ValueNotifier<LatLng?> latLng = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    addressDescriptionController.text =
        widget.storeAddressEntity?.address ?? '';
    country = widget.storeAddressEntity?.country;
    area = widget.storeAddressEntity?.area;
    city = widget.storeAddressEntity?.city;
    final lat = double.tryParse(widget.storeAddressEntity?.lat ?? '');
    final lng = double.tryParse(widget.storeAddressEntity?.lng ?? '');
    if (lat != null && lng != null && isValidLatLng(lat, lng)) {
      latLng.value = LatLng(lat, lng);
    }
  }

  bool isValidLatLng(double lat, double lng) {
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreAddressCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CountriesDropDown(
              country: country,
              onChanged: (value) {
                country = value!;
              },
            ),
            AreasDropDown(
              area: area,
              onChanged: (value) => area = value!,
            ),
            CitiesDropDown(
              city: city,
              onChanged: (value) => city = value!,
            ),
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
                    initialPosition: latLng.value,
                    onLocationChanged: (address) {
                      latLng.value = LatLng(address.lat, address.long);
                    },
                  );
                }),
            const SizedBox(height: 50),
            BlocConsumer<StoreAddressCubit, Async>(
              listener: (context, state) {
                if (state.isFailure) {
                  AppToasts.error(context, message: state.errorMessage ?? '');
                } else if (state.isSuccess) {
                  AppToasts.success(context,
                      message: appLocalizer.profileUpdateSuccessMessage);
                }
              },
              builder: (context, state) {
                return AppButton(
                  isLoading: state.isLoading,
                  text: appLocalizer.edit,
                  onPressed: () {
                    context.read<StoreAddressCubit>().providerStoreAddress(
                          StoreAddressParams(
                            address: addressDescriptionController.text,
                            countryId: country?.id,
                            areaId: area?.id,
                            cityId: city?.id,
                            lat: latLng.value?.latitude.toString(),
                            lng: latLng.value?.longitude.toString(),
                            isUpdate: true,
                          ),
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ).paddingHorizontal(20);
  }
}
