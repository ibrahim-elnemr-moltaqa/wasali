import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
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
  late TextEditingController addressDescriptionController;
  late CommonEntity? country;
  late CommonEntity? area;
  late CommonEntity? city;
  LatLng? latLng;

  @override
  void initState() {
    super.initState();
    addressDescriptionController =
        TextEditingController(text: widget.storeAddressEntity?.address ?? '');
    country = widget.storeAddressEntity?.country;
    area = widget.storeAddressEntity?.area;
    city = widget.storeAddressEntity?.city;
    // latLng = LatLng(double.parse(widget.storeAddressEntity?.lat ?? '0'),
    //     double.parse(widget.storeAddressEntity?.lng ?? '0'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const YourLocationOnMapWidget(),
        const SizedBox(height: 50),
        AppButton(
          text: appLocalizer.edit,
          onPressed: () {},
        ),
      ],
    ).paddingHorizontal(20);
  }
}
