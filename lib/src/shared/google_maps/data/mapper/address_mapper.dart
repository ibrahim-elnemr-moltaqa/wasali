import '../../domain/models/address_entity.dart';
import '../models/api_address_model.dart';

extension PlaceDetailsMapper on ApiMapPlaceDetailsModel {
  MapAddressEntity get map {
    return MapAddressEntity(
        address: formattedAddress ?? '',
        lat: geometry?.location?.lat ?? 0,
        long: geometry?.location?.lng ?? 0,
        component: (country == null &&
                area == null &&
                city == null &&
                district == null &&
                streetName == null)
            ? null
            : MapAddressComponentEntity(
                country: country,
                area: area,
                city: city,
                district: district,
                streetName: streetName));
  }
}
