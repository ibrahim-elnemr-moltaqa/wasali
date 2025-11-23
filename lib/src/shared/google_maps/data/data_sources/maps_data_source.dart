// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uuid/uuid.dart';
import 'package:wasli/core/core.dart';
import '../../domain/use_cases/google_maps_api/get_location_address_use_case.dart';
import '../../utils/maps_constants.dart';
import '../models/api_address_model.dart';
import '../models/api_location_address_model.dart';
import '../models/api_place_suggessions_model.dart';

const String _KGoogleMapsKey = GoogleMapsConstants.googleMapsApiKey;
const String _KGoogleMapsApiBaseUrl = "https://maps.googleapis.com/maps/api";
const String _KPlacesAutoCompleteCollection = "/place/autocomplete/json";
const String _KGeoCodingCollection = "/geocode/json";
const String _KPlaceDetailsCollection = "/place/details/json";

abstract class MapsDataSource {
  Future<List<ApiMapPlaceSuggestionModel>> getSearchSuggestions(
      String searchText);

  Future<ApiMapPlaceDetailsModel> getMapLocationAddress(
      GetMapLocationAddressParams params);

  Future<ApiMapPlaceDetailsModel> getPlaceDetails(String placeId);
}

@Injectable(as: MapsDataSource)
class MapsDataSourceImpl implements MapsDataSource {
  final String _sessionToken = const Uuid().v4();
  MapsDataSourceImpl() {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100));
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _KGoogleMapsApiBaseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(milliseconds: 20000),
    ),
  );

  @override
  Future<List<ApiMapPlaceSuggestionModel>> getSearchSuggestions(
    String searchText,
  ) async {
    try {
      final String langCode = await _getAppLanguage();
      final response = await _dio.get(
        _KPlacesAutoCompleteCollection,
        queryParameters: {
          'input': searchText,
          'language': langCode,
          'key': _KGoogleMapsKey,
          'sessiontoken': _sessionToken
        },
      );
      final responseData =
          ApiMapPlaceSuggestionsResponse.fromJson(response.data);

      if (responseData.errorMessage != null &&
          responseData.errorMessage!.isNotEmpty) {
        throw ServerException(
          message: responseData.errorMessage ?? '',
        );
      } else {
        return responseData.predictions;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiMapPlaceDetailsModel> getMapLocationAddress(
      GetMapLocationAddressParams params) async {
    try {
      final String langCode = await _getAppLanguage();
      final response = await _dio.get(
        _KGeoCodingCollection,
        queryParameters: {
          'latlng': "${params.lat},${params.long}",
          'key': GoogleMapsConstants.googleMapsApiKey,
          "language": langCode
        },
      );
      final responseData = ApiAddressFromLatLonResponse.fromJson(response.data);
      final data = responseData.responseDetails;
      if (responseData.errorMessage != null &&
              responseData.errorMessage!.isNotEmpty ||
          (data?.length ?? 0) < 2) {
        throw ServerException(
          message: responseData.errorMessage ?? '',
        );
      } else {
        final address = data![1];
        address.geometry?.location?.lat = params.lat;
        address.geometry?.location?.lng = params.long;
        return address;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiMapPlaceDetailsModel> getPlaceDetails(String placeId) async {
    try {
      final String langCode = await _getAppLanguage();
      final response = await _dio.get(
        _KPlaceDetailsCollection,
        queryParameters: {
          'place_id': placeId,
          'sessiontoken': _sessionToken,
          'key': GoogleMapsConstants.googleMapsApiKey,
          "language": langCode
        },
      );
      final responseData = ApiPlaceDetailsResponse.fromJson(response.data);
      final placeDetails = responseData.placeDetails;
      if (responseData.isSuccess && placeDetails != null) {
        throw ServerException(
          message: appLocalizer.failedToGetLocationDetails,
        );
      } else {
        return placeDetails!;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _getAppLanguage() async {
    return getLocale.languageCode;
  }
}
