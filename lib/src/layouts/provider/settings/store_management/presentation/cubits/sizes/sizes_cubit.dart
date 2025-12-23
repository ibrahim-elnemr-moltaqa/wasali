import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/change_size_status_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/create_size_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/delete_size_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_products_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_size_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_sizes_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/update_size_use_case.dart';

part 'sizes_state.dart';

class SizesCubit extends Cubit<SizesState> {
  SizesCubit() : super(const SizesState.initial());

  final GetSizesUseCase _getSizesUseCase = injector();
  final GetSizeUseCase _getSizeUseCase = injector();
  final CreateSizeUseCase _createSizeUseCase = injector();
  final UpdateSizeUseCase _updateSizeUseCase = injector();
  final DeleteSizeUseCase _deleteSizeUseCase = injector();
  final ChangeSizeStatusUseCase _changeSizeStatusUseCase = injector();

  Future<void> getSizes({String? name, int? active}) async {
    final activeVal = active ?? state.activeFilter;
    emit(state.copyWith(
      sizesState: const Async.loading(),
      activeFilter: active,
    ));
    final result = await _getSizesUseCase(
        ManagementFetchParams(name: name, active: activeVal));
    result.fold((error) {
      emit(state.copyWith(sizesState: Async.failure(error)));
    }, (sizes) {
      emit(state.copyWith(sizesState: Async.success(sizes)));
    });
  }

  Future<void> getSize(int id) async {
    emit(state.copyWith(getSizeState: const Async.loading()));
    final result = await _getSizeUseCase(id);
    result.fold((error) {
      emit(state.copyWith(getSizeState: Async.failure(error)));
    }, (size) {
      emit(state.copyWith(getSizeState: Async.success(size)));
    });
  }

  Future<void> createSize(String name) async {
    emit(state.copyWith(createSizeState: const Async.loading()));
    final result = await _createSizeUseCase(name);
    result.fold((error) {
      emit(state.copyWith(createSizeState: Async.failure(error)));
    }, (size) {
      final currentList = state.sizesState.data ?? [];
      emit(state.copyWith(
        createSizeState: Async.success(size),
        sizesState: Async.success([size, ...currentList]),
      ));
    });
  }

  Future<void> updateSize(String name) async {
    emit(state.copyWith(updateSizeState: const Async.loading()));
    final result = await _updateSizeUseCase(name);
    result.fold((error) {
      emit(state.copyWith(updateSizeState: Async.failure(error)));
    }, (size) {
      final currentList = state.sizesState.data ?? [];
      final updatedList =
          currentList.map((e) => e.id == size.id ? size : e).toList();
      emit(state.copyWith(
        updateSizeState: Async.success(size),
        sizesState: Async.success(updatedList),
      ));
    });
  }

  Future<void> deleteSize(int id) async {
    emit(state.copyWith(
      deleteSizeState: const Async.loading(),
    ));
    final result = await _deleteSizeUseCase(id);
    result.fold((error) {
      emit(state.copyWith(deleteSizeState: Async.failure(error)));
    }, (_) {
      final currentList = state.sizesState.data ?? [];
      final updatedList = currentList.where((e) => e.id != id).toList();
      emit(state.copyWith(
        deleteSizeState: const Async.success(unit),
        sizesState: Async.success(updatedList),
        selectedSizeIdState: Async.success(id),
      ));
    });
  }

  Future<void> changeSizeStatus(int id) async {
    emit(state.copyWith(changeSizeStatusState: const Async.loading()));
    final result = await _changeSizeStatusUseCase(id);
    result.fold((error) {
      emit(state.copyWith(changeSizeStatusState: Async.failure(error)));
    }, (_) {
      final currentList = state.sizesState.data ?? [];
      final updatedList = currentList.map((e) {
        if (e.id == id) {
          return e.copyWith(status: e.status == 1 ? 0 : 1);
        }
        return e;
      }).toList();
      emit(state.copyWith(
        changeSizeStatusState: const Async.success(unit),
        sizesState: Async.success(updatedList),
      ));
    });
  }
}
