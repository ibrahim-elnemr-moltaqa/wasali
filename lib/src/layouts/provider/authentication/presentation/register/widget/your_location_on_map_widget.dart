import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/shared/google_maps/domain/models/address_entity.dart';

const CameraPosition _kInitialPosition = CameraPosition(
  target: LatLng(24.774265, 46.738586),
  zoom: 11.0,
);

class YourLocationOnMapWidget extends StatefulWidget {
  const YourLocationOnMapWidget({
    super.key,
    this.initialPosition,
    required this.onLocationChanged,
  });

  final LatLng? initialPosition;
  final void Function(MapAddressEntity address) onLocationChanged;

  @override
  State<YourLocationOnMapWidget> createState() =>
      _YourLocationOnMapWidgetState();
}

class _YourLocationOnMapWidgetState extends State<YourLocationOnMapWidget> {
  MapAddressEntity? address;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    if (widget.initialPosition != null) {
      address = MapAddressEntity(
        address: '',
        lat: widget.initialPosition!.latitude,
        long: widget.initialPosition!.longitude,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
              if (widget.initialPosition != null) {
                mapController?.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: widget.initialPosition!,
                    zoom: 14.0,
                  ),
                ));
              }
            },
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            padding: const EdgeInsets.only(
                bottom: 150, left: 10, right: 10, top: 150),
            markers: {
              if (address != null)
                Marker(
                  markerId: const MarkerId('1'),
                  position: LatLng(address!.lat, address!.long),
                )
            },
            zoomControlsEnabled: false,
            onTap: (argument) {
              AppRouter.pushNamed(AppRoutes.mapPage).then((value) {
                if (value == null) return;
                setState(() {
                  address = value as MapAddressEntity;
                });
                mapController?.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(address!.lat, address!.long),
                    zoom: 14.0,
                  ),
                ));
                widget.onLocationChanged(address!);
              });
            },
          ),
        )).setTitle(title: appLocalizer.your_location_on_map);
  }
}
