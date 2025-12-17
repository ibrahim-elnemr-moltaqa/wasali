import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'store_management_state.dart';

class StoreManagementCubit extends Cubit<StoreManagementState> {
  StoreManagementCubit() : super(StoreManagementInitial());
}
