// import 'dart:convert';

// import 'package:malahi/features/google_maps/domain/models/address_entity.dart';

// class ApiMapAddressModel extends MapAddressEntity {
//   ApiMapAddressModel(
//       {required String address,
//       required super.lat,
//       required super.long,
//       required super.component}) {
//     try {
//       final decodedString = json.decode(address);
//       final tempComponnent = ApiMapAddressComponentModel.fromMap(decodedString);
//       component = tempComponnent;
//       super.address =
//           tempComponnent.isEmpty ? address : tempComponnent.getFormattedAddress;
//     } catch (_) {
//       _address = address;
//       component = null;
//     }
//   }
// }

// class ApiMapAddressComponentModel extends MapAddressComponentEntity {
//   const ApiMapAddressComponentModel({
//     super.area,
//     super.city,
//     super.district,
//     super.country,
//     super.streetName,
//   });

//   factory ApiMapAddressComponentModel.fromMap(Map<String, dynamic> mapValue) {
//     return ApiMapAddressComponentModel(
//       country: mapValue[_kCountryKey],
//       area: mapValue[_kAreaKey],
//       city: mapValue[_kCityKey],
//       district: mapValue[_kDistrictKey],
//       streetName: mapValue[_kStreetNameKey],
//     );
//   }

//   Map<String, dynamic> get toMap => {
//         _kCountryKey: country,
//         _kAreaKey: area,
//         _kCityKey: city,
//         _kDistrictKey: district,
//         _kStreetNameKey: streetName,
//       };

//   String get toJson => json.encode(toMap);

//   @override
//   List<Object?> get props => [country, area, city, district, streetName];
// }

// const String _kCountryKey = "country";
// const String _kAreaKey = "area";
// const String _kCityKey = "city";
// const String _kDistrictKey = "district";
// const String _kStreetNameKey = "streetName";
