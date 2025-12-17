part of 'store_management_cubit.dart';

sealed class StoreManagementState extends Equatable {
  const StoreManagementState();

  @override
  List<Object> get props => [];
}

final class StoreManagementInitial extends StoreManagementState {}
