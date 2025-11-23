import 'dart:io';

import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';

class GoogleMapsConstants {
  static const String googleMapsApiKey =
      "AIzaSyDQva2l_m1BoZ5EB-NhOlvo-EWCgxjSBnA";

  /// Docs Link [https://developers.google.com/maps/documentation/maps-static/start]
  static String getStaticMapImage({required double lat, required double long}) {
    final String languageCode =
        injector<LocalizationContainer>().appLanguage.value;
    // const String mapMarkerUrl =
    // "https://api.yoloapp.net/static/location_marker.png";
    return 'https://maps.googleapis.com/maps/api/staticmap'
        '?center=$lat,$long'
        // '&markers=icon:${Uri.encodeComponent(mapMarkerUrl)}|$lat,$long'
        '&markers=size:mid|color:blue|$lat,$long'
        '&zoom=17'
        '&size=450x350'
        '&maptype=terrain'
        '&key=$googleMapsApiKey'
        '&language=$languageCode';
  }

  static String getGoogleMapsLocationLink(double latitude, double longitude) {
    return 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  }

  /// [getMapsAppDynamicLink] In Ios App Opens With App Dynamic Link But IN Android Open With launch Link [getGoogleMapsLocationLink]
  static String getMapsAppDynamicLink(double latitude, double longitude) {
    if (Platform.isIOS) {
      return 'http://maps.apple.com/?ll=$latitude,$longitude';
    } else {
      return getGoogleMapsLocationLink(latitude, longitude);
    }
  }
}
