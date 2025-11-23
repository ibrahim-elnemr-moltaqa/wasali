import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/media/svg_icon.dart';
import '../domain/models/address_entity.dart';
import '../domain/use_cases/google_maps_api/get_location_address_use_case.dart';
import 'maps_main_cubit.dart';
import 'maps_main_state.dart';
import 'widgets/main_page_app_bar.dart';
part 'widgets/only_preview_widgets.dart';
part "widgets/selectable_map_widgets.dart";

const CameraPosition _kInitialPosition = CameraPosition(
  target: LatLng(24.774265, 46.738586),
  zoom: 11.0,
);

class MapsMainPage extends StatelessWidget {
  const MapsMainPage({
    super.key,
    this.initialMapAddress,
    this.onlyPreviewAddress = false,
  });
  final MapAddressEntity? initialMapAddress;
  final bool onlyPreviewAddress;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsMainCubit(),
      child: _MapsMainPageBody(
        onlyPreviewAddress: onlyPreviewAddress,
        initialMapAddress: initialMapAddress,
      ),
    );
  }
}

class _MapsMainPageBody extends StatefulWidget {
  const _MapsMainPageBody({
    this.initialMapAddress,
    this.onlyPreviewAddress = false,
  });
  final MapAddressEntity? initialMapAddress;
  final bool onlyPreviewAddress;

  @override
  State<StatefulWidget> createState() => _MapsMainPageBodyState();
}

class _MapsMainPageBodyState extends State<_MapsMainPageBody> {
  late GoogleMapController _mapController;
  bool _isMapCreated = false;

  final Set<Marker> _mapMarkers = {};
  final Uuid _uuidObj = const Uuid();

  bool get isOnlyForPreview {
    return widget.onlyPreviewAddress && _isMapCreated;
  }

  @override
  void initState() {
    _setLocationMarkerIconsImage();
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapsMainCubit, MapsMainState>(
      listenWhen: (previous, current) =>
          previous.locationState != current.locationState,
      listener: (context, state) {
        if (state.locationState.isSuccess) {
          final latlng = state.locationState.data?.getAsaLtLng;
          if (latlng != null) {
            _setCurrentMapLocation(latlng,
                snippet: state.locationState.data?.address);
          }
        }
      },
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                onMapCreated: onMapCreated,
                initialCameraPosition: _kInitialPosition,
                myLocationEnabled: true,
                padding: const EdgeInsets.only(
                    bottom: 150, left: 10, right: 10, top: 150),
                markers: {..._mapMarkers},
                zoomControlsEnabled: false,
                onTap: _onMapTapped),
            if (_isMapCreated)
              if (!isOnlyForPreview)
                const _SelectableMapWidgets()
              else
                _OnlyMapAddressPreviewWidget(
                  addressEntity: widget.initialMapAddress!,
                  onAddressTapped: () {
                    _setMapPosition(widget.initialMapAddress!.getAsaLtLng);
                  },
                ),
          ],
        ),
      ),
    );
  }

  Timer? _getLocationAddressDebounceTimer;
  BitmapDescriptor userMarkerIcon = BitmapDescriptor.defaultMarker;

  void _setLocationMarkerIconsImage() async {
    userMarkerIcon = await BitmapDescriptor.asset(
        ImageConfiguration.empty, "assets/images/marker.png");
    setState(() {});
  }

  void _getTappedLocationAddress(LatLng tappedPoint) {
    _getLocationAddressDebounceTimer?.cancel();
    _getLocationAddressDebounceTimer = null;
    _getLocationAddressDebounceTimer =
        Timer.periodic(const Duration(milliseconds: 850), (timer) {
      context.read<MapsMainCubit>().getLocationAddress(
          GetMapLocationAddressParams(
              lat: tappedPoint.latitude, long: tappedPoint.longitude));
      _getLocationAddressDebounceTimer?.cancel();
      _getLocationAddressDebounceTimer = null;
    });
  }

  void _setCurrentMapLocation(LatLng latLng, {String? snippet}) {
    _setMapPosition(latLng);
    _mapMarkers.clear();
    _mapMarkers.add(Marker(
        markerId: MarkerId(_uuidObj.v4()),
        position: latLng,
        infoWindow: InfoWindow(
          title: appLocalizer.address_details,
          snippet: snippet,
        )));
    setState(() {});
  }

  void _setMapPosition(LatLng latLng) async {
    if (_isMapCreated == false) {
      return;
    }
    await _mapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: latLng,
      zoom: 14.0,
    )));
  }

  void _onMapTapped(LatLng tappedPoint) {
    if (widget.onlyPreviewAddress) {
      return;
    }
    _mapMarkers.clear();
    _mapMarkers.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
        infoWindow: InfoWindow(
          title: appLocalizer.your_location_on_map,
        )));
    setState(() {});
    _getTappedLocationAddress(tappedPoint);
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
      _isMapCreated = true;
    });
    // Log any style errors to the console for debugging.
    if (kDebugMode) {
      _mapController.getStyleError().then((String? error) {
        if (error != null) {
          debugPrint(error);
        }
      });
    }
    _setInitialMapAddress();
  }

  void _setInitialMapAddress() {
    final address = widget.initialMapAddress;

    if (address != null) {
      context.read<MapsMainCubit>().setLocationAddressData(address);
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    _getLocationAddressDebounceTimer?.cancel();
    _getLocationAddressDebounceTimer = null;
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.dispose();
  }
}
