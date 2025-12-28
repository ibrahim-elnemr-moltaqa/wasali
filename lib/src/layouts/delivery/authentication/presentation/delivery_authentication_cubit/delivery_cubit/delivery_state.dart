part of 'delivery_cubit.dart';

class DeliveryState extends Equatable {
  final Async<DeliveryUserEntity> deliveryState;
  final Async<Unit> deleteImageState;

  const DeliveryState({
    required this.deliveryState,
    required this.deleteImageState,
  });

  const DeliveryState.initial()
      : this(
          deliveryState: const Async.initial(),
          deleteImageState: const Async.initial(),
        );

  DeliveryState copyWith({
    Async<DeliveryUserEntity>? deliveryState,
    Async<Unit>? deleteImageState,
  }) {
    return DeliveryState(
      deliveryState: deliveryState ?? this.deliveryState,
      deleteImageState: deleteImageState ?? this.deleteImageState,
    );
  }

  @override
  List<Object?> get props => [
        deliveryState,
        deleteImageState,
      ];
}
