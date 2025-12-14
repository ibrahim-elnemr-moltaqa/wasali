import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_vehicle_data_use_case.dart';

class VehicleDataCubit extends Cubit<Async> {
  VehicleDataCubit() : super(const Async.initial());

  final DeliveryVehicleDataUseCase _deliveryVehicleDataUseCase = injector();
  Future<void> vehicleData(DeliveryVehicleParams params) async {
    emit(const Async.loading());
    final result = await _deliveryVehicleDataUseCase(params);
    emit(result.fold(
      (l) => Async.failure(l),
      (r) => const Async.successWithoutData(),
    ));
  }
}
