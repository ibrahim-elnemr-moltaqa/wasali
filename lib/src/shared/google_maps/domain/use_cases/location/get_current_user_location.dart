import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import '../../models/address_entity.dart';
import '../google_maps_api/get_location_address_use_case.dart';
import 'enable_gps_and_handle_premistion.dart';

@Injectable()
class GetCurrentUserLocationUseCase {
  final Location _locationObj = Location();
  final EnableGpsAndHandlePermissionUseCase
      _enableGpsAndHandlePermissionUseCase;
  final GetMapLocationAddressUseCase _parseLatLngUseCase;

  GetCurrentUserLocationUseCase(
    this._enableGpsAndHandlePermissionUseCase,
    this._parseLatLngUseCase,
  );

  Future<MapAddressEntity?> call() async {
    try {
      MapAddressEntity? address;

      /// First Check if location premession if ok and GPS is enabled
      ///
      final bool isGPSEnabled = await _enableGpsAndHandlePermissionUseCase();
      if (!isGPSEnabled) {
        return address;
      }
      final locationResult = await _locationObj.getLocation();
      final double? latitude = locationResult.latitude;
      final double? longitude = locationResult.longitude;
      if (latitude == null || longitude == null) {
        return address;
      }

      /// After get LatLng decode it to get address
      final geocodeResult = await _parseLatLngUseCase(
          GetMapLocationAddressParams(lat: latitude, long: longitude));
      geocodeResult.fold(
        (l) {
          return null;
        },
        (right) {
          address = right;
        },
      );
      return address;
    } catch (e) {
      log("GetCurrentUserLocationUseCase Failed",
          error: e, name: "Get CurrentUser Location");
      return null;
    }
  }
}
