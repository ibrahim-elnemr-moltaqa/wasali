// import 'dart:convert';
// import 'package:dalily_medical/features/google_maps/domain/models/address_entity.dart';
// import 'package:equatable/equatable.dart';

// class UserAddressEntity extends Equatable {
//   late final String _address;
//   final double lat;
//   final double lng;
//   late final MapAddressComponentEntity? component;

//   UserAddressEntity({
//     required String address,
//     required this.lat,
//     required this.lng,
//   }) {
//     try {
//       final decodedString = json.decode(address);
//       final tempComponnent = MapAddressComponentEntity.fromMap(decodedString);
//       component = tempComponnent;
//       _address =
//           tempComponnent.isEmpty ? address : tempComponnent.getFormattedAddress;
//     } catch (_) {
//       _address = address;
//       component = null;
//     }
//   }

//   String get address => component?.getFormattedAddress ?? _address;

//   String get addressFirstSection {
//     String temp = '';
//     if (component?.country?.isNotEmpty == true) {
//       temp += "${component?.country}";
//     }
//     if (component?.area?.isNotEmpty == true) {
//       temp += "\t,\t${component?.area}";
//     }
//     if (temp.isNotEmpty) {
//       return temp.replaceFirst(RegExp(r'^\s*,\s*'), '');
//     } else {
//       return _address.replaceFirst(RegExp(r'^\s*,\s*'), '');
//     }
//   }

//   String? get addressSecondSection {
//     String temp = '';
//     if (component?.city?.isNotEmpty == true) {
//       temp += "${component?.city}";
//     }
//     if (component?.district?.isNotEmpty == true) {
//       temp += "\t,\t${component?.district}";
//     }
//     if (component?.streetName?.isNotEmpty == true) {
//       temp += "\t,\t${component?.streetName}";
//     }
//     if (temp.isNotEmpty) {
//       return temp.replaceFirst(RegExp(r'^\s*,\s*'), '');
//     } else {
//       return null;
//     }
//   }

//   /// This Parts [toMap]
//   /// Used for cache handle
//   Map<String, dynamic> get toMap => {
//         _addressKey: component?.toJson ?? _address,
//         _latKey: lat,
//         _lngKey: lng,
//       };

//   factory UserAddressEntity.fromMap(Map<String, dynamic> map) {
//     return UserAddressEntity(
//       address: map[_addressKey] as String,
//       lat: map[_latKey] as double,
//       lng: map[_lngKey] as double,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         _address,
//         lat,
//         lng,
//       ];

//   @override
//   String toString() {
//     return "[UserAddressEntity]  Address : $_address ::: Lat : $lat ::: Lng : $lng";
//   }

//   MapAddressEntity get getAsMapAddressEntity => MapAddressEntity(
//         address: address,
//         lat: lat,
//         long: lng,
//         component: component,
//       );
// }

// const String _addressKey = "address";
// const String _latKey = "lat";
// const String _lngKey = "lng";
