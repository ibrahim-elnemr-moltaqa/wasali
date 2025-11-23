import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/google_maps/domain/use_cases/location/get_current_user_location.dart';

import '../domain/models/address_entity.dart';
import '../domain/use_cases/google_maps_api/get_location_address_use_case.dart';
import 'maps_main_state.dart';

class MapsMainCubit extends Cubit<MapsMainState> {
  MapsMainCubit() : super(const MapsMainState.initial()) {
    _initUseCases();
    _getCurrentUserLocation();
  }

  late final GetMapLocationAddressUseCase _getMapLocationAddressUseCase;
  late final GetCurrentUserLocationUseCase _getCurrentUserLocationUseCase;

  void _initUseCases() {
    _getMapLocationAddressUseCase = injector();
    _getCurrentUserLocationUseCase = injector();
  }

  void getLocationAddress(GetMapLocationAddressParams params) async {
    emit(state.copyWith(locationState: const Async.loading()));
    final result = await _getMapLocationAddressUseCase(params);
    result.fold((error) {
      emit(state.copyWith(locationState: Async.failure(error)));
    }, (address) {
      emit(state.copyWith(locationState: Async.success(address)));
    });
  }

  void _getCurrentUserLocation() async {
    emit(state.copyWith(locationState: const Async.loading()));
    final address = await _getCurrentUserLocationUseCase();

    if (address == null) {
      emit(state.copyWith(
          locationState: const Async.failure(
              Failure(message: 'Failed to get current location'))));
    } else {
      emit(state.copyWith(locationState: Async.success(address)));
    }
  }

  void setLocationAddressData(MapAddressEntity data) {
    emit(state.copyWith(locationState: const Async.initial()));
    emit(state.copyWith(locationState: Async.success(data)));
  }

  @override
  void emit(MapsMainState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
