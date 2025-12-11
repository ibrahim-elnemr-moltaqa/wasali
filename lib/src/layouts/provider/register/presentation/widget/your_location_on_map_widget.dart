import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';

const CameraPosition _kInitialPosition = CameraPosition(
  target: LatLng(24.774265, 46.738586),
  zoom: 11.0,
);

class YourLocationOnMapWidget extends StatelessWidget {
  const YourLocationOnMapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: GoogleMap(
            onMapCreated: (controller) {},
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            padding: const EdgeInsets.only(
                bottom: 150, left: 10, right: 10, top: 150),
            markers: {},
            zoomControlsEnabled: false,
            onTap: (argument) {
              AppRouter.pushNamed(AppRoutes.mapPage);
            },
          ),
        )).setTitle(title: appLocalizer.your_location_on_map);
  }
}
