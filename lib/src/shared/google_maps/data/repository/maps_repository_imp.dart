import 'dart:io';
import 'package:wasli/core/core.dart';
import '../mapper/address_mapper.dart';
import '../mapper/place_suggessions_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/address_entity.dart';
import '../../domain/models/place_suggestion_entity.dart';
import '../../domain/repository/maps_repository.dart';
import '../../domain/use_cases/google_maps_api/get_location_address_use_case.dart';
import '../data_sources/maps_data_source.dart';

@Injectable(as: MapsRepository)
class MapsRepositoryImp implements MapsRepository {
  final MapsDataSource _mapsDataSource;

  MapsRepositoryImp(this._mapsDataSource, );
  @override
  Future<Either<Failure, List<MapPlaceSuggestionsEntity>>> getSearchSuggestions(
      String text) async {
    try {
      final result = await _mapsDataSource.getSearchSuggestions(text);
      final listData = result.map((e) => e.map).toList();
      return Right(listData);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        errorMap: e.errorMap,
      ));
    } on SocketException {
      return Left(ServerFailure(
        message: appLocalizer.noInternetConnection,
        errorMap: null,
      ));
    } catch (e) {
      return Left(ServerFailure(
        message: appLocalizer.somethingWentWrong,
        errorMap: null,
      ));
    }
  }

  @override
  Future<Either<Failure, MapAddressEntity>> getLocationAddress(
      GetMapLocationAddressParams params) async {
    try {
      final result = await _mapsDataSource.getMapLocationAddress(params);
      return Right(result.map);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        errorMap: e.errorMap,
      ));
    } on SocketException {
      return Left(ServerFailure(
        message: appLocalizer.noInternetConnection,
        errorMap: null,
      ));
    } catch (e) {
      return Left(ServerFailure(
        message: appLocalizer.somethingWentWrong,
        errorMap: null,
      ));
    }
  }

  @override
  Future<Either<Failure, MapAddressEntity>> getPlaceDetails(
      String placeID) async {
    try {
      final result = await _mapsDataSource.getPlaceDetails(placeID);
      return Right(result.map);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        errorMap: e.errorMap,
      ));
    } on SocketException {
      return Left(ServerFailure(
        message: appLocalizer.noInternetConnection,
        errorMap: null,
      ));
    } catch (e) {
      return Left(ServerFailure(
        message: appLocalizer.somethingWentWrong,
        errorMap: null,
      ));
    }
  }
}
