import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import '../models/address_entity.dart';
import '../models/place_suggestion_entity.dart';
import '../use_cases/google_maps_api/get_location_address_use_case.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<MapPlaceSuggestionsEntity>>> getSearchSuggestions(
      String text);

  Future<Either<Failure, MapAddressEntity>> getLocationAddress(
      GetMapLocationAddressParams params);

  Future<Either<Failure, MapAddressEntity>> getPlaceDetails(String placeID);
}
