import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import '../../data/model/working_day_model.dart';
import '../../domain/use_case/create_working_day_use_case.dart';
import '../../domain/use_case/delete_working_day_use_case.dart';
import '../../domain/use_case/get_working_days_use_case.dart';
import '../../domain/use_case/update_working_day_use_case.dart';

part 'working_days_state.dart';

class WorkingDaysCubit extends Cubit<WorkingDaysState> {
  WorkingDaysCubit() : super(const WorkingDaysState.initial());

  final GetWorkingDaysUseCase _getWorkingDaysUseCase = injector();
  final CreateWorkingDayUseCase _createWorkingDayUseCase = injector();
  final UpdateWorkingDayUseCase _updateWorkingDayUseCase = injector();
  final DeleteWorkingDayUseCase _deleteWorkingDayUseCase = injector();

  Future<void> getWorkingDays() async {
    emit(state.copyWith(workingDaysState: const Async.loading()));
    final result = await _getWorkingDaysUseCase(NoParams());
    result.fold((error) {
      emit(state.copyWith(workingDaysState: Async.failure(error)));
    }, (workingDays) {
      emit(state.copyWith(workingDaysState: Async.success(workingDays)));
    });
  }

  Future<void> createWorkingDay(WorkingDayModel workingDay) async {
    emit(state.copyWith(createWorkingDayState: const Async.loading()));
    final result = await _createWorkingDayUseCase(workingDay);
    result.fold((error) {
      emit(state.copyWith(createWorkingDayState: Async.failure(error)));
    }, (_) {
      emit(state.copyWith(createWorkingDayState: const Async.success(unit)));
      getWorkingDays(); 
    });
  }

  Future<void> updateWorkingDay(WorkingDayModel workingDay) async {
    emit(state.copyWith(updateWorkingDayState: const Async.loading()));
    final result = await _updateWorkingDayUseCase(workingDay);
    result.fold((error) {
      emit(state.copyWith(updateWorkingDayState: Async.failure(error)));
    }, (_) {
      emit(state.copyWith(updateWorkingDayState: const Async.success(unit)));
      getWorkingDays(); 
    });
  }

  Future<void> deleteWorkingDay(int id) async {
    emit(state.copyWith(deleteWorkingDayState: const Async.loading()));
    final result = await _deleteWorkingDayUseCase(id);
    result.fold((error) {
      emit(state.copyWith(deleteWorkingDayState: Async.failure(error)));
    }, (_) {
      emit(state.copyWith(deleteWorkingDayState: const Async.success(unit)));
      final currentList = state.workingDaysState.data ?? [];
      final updatedList = currentList.where((e) => e.id != id).toList();
      emit(state.copyWith(workingDaysState: Async.success(updatedList)));
    });
  }
}
