import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAddressEntity extends Equatable {
  final String address;
  final double lat;
  final double long;
  final MapAddressComponentEntity? component;

  LatLng get coordinates => LatLng(lat, long);

  const MapAddressEntity({
    required this.address,
    required this.lat,
    required this.long,
    this.component,
  });

  LatLng get getAsaLtLng => LatLng(lat, long);

  String get getParsedAddress {
    if (component != null) {
      return component!.toJson;
    }
    return address;
  }

  @override
  List<Object?> get props => [address, lat, long, component];
}

class MapAddressComponentEntity extends Equatable {
  final String? country;
  final String? area;
  final String? city;
  final String? district;
  final String? streetName;

  const MapAddressComponentEntity(
      {this.country, this.area, this.city, this.district, this.streetName});

  String get getFormattedAddress {
    String tempString = "";
    if (country?.isNotEmpty == true) {
      tempString += "$country, ";
    }
    if (area?.isNotEmpty == true) {
      tempString += "$area, ";
    }
    if (city?.isNotEmpty == true) {
      tempString += "$city, ";
    }
    if (district?.isNotEmpty == true) {
      tempString += "$district, ";
    }
    if (streetName?.isNotEmpty == true) {
      tempString += "$streetName, ";
    }
    return tempString;
  }

  bool get isEmpty =>
      country == null &&
      area == null &&
      city == null &&
      district == null &&
      streetName == null;

  factory MapAddressComponentEntity.fromMap(Map<String, dynamic> mapValue) {
    return MapAddressComponentEntity(
      country: mapValue[_kCountryKey],
      area: mapValue[_kAreaKey],
      city: mapValue[_kCityKey],
      district: mapValue[_kDistrictKey],
      streetName: mapValue[_kStreetNameKey],
    );
  }

  Map<String, dynamic> get toMap => {
        _kCountryKey: country,
        _kAreaKey: area,
        _kCityKey: city,
        _kDistrictKey: district,
        _kStreetNameKey: streetName,
      };

  String get toJson => json.encode(toMap);

  @override
  List<Object?> get props => [country, area, city, district, streetName];
}

const String _kCountryKey = "country";
const String _kAreaKey = "area";
const String _kCityKey = "city";
const String _kDistrictKey = "district";
const String _kStreetNameKey = "streetName";
