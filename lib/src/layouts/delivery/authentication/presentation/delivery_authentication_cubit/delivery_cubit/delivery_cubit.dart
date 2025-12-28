import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delete_image_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/get_delivery_use_case.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(const DeliveryState.initial());

  final GetDeliveryUseCase _getDeliveryUseCase = injector();
  final DeleteImageUseCase _deleteImageUseCase = injector();
  Future<void> getDelivery() async {
    emit(state.copyWith(
      deliveryState: const Async.loading(),
    ));
    final result = await _getDeliveryUseCase(NoParams());
    emit(result.fold(
      (l) => state.copyWith(deliveryState: Async.failure(l)),
      (delivery) => state.copyWith(deliveryState: Async.success(delivery)),
    ));
  }

  Future<void> deleteImage(int imageId, String type) async {
    emit(state.copyWith(
      deleteImageState: const Async.loading(),
    ));
    final result = await _deleteImageUseCase(DeleteImageParams(imageId: imageId, type: type));
    emit(result.fold(
      (l) => state.copyWith(deleteImageState: Async.failure(l)),
      (_) => state.copyWith(deleteImageState: const Async.successWithoutData()),
    ));
  }
}
