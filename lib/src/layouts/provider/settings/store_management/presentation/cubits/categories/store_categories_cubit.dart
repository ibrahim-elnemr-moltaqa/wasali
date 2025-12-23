import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_categories_repository.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/repository/common_repository.dart';

part 'store_categories_state.dart';

class StoreCategoriesCubit extends Cubit<StoreCategoriesState> {
  StoreCategoriesCubit() : super(const StoreCategoriesState.initial());

  final StoreCategoriesRepository _storeCategoriesRepository = injector();
  final CommonRepository _commonRepository = injector();

  Future<void> getProfileSubCategories({String? name, int? active}) async {
    final activeVal = active ?? state.activeFilter;
    emit(state.copyWith(
      profileSubCategoriesState: const Async.loading(),
      activeFilter: active,
    ));
    final result = await _storeCategoriesRepository.getProfileSubCategories(
        name: name, active: activeVal);
    result.fold(
      (error) => emit(
          state.copyWith(profileSubCategoriesState: Async.failure(error))),
      (data) =>
          emit(state.copyWith(profileSubCategoriesState: Async.success(data))),
    );
  }

  Future<void> getAllSubCategories() async {
    emit(state.copyWith(allSubCategoriesState: const Async.loading()));
    final result = await _commonRepository.getSubCategories();
    result.fold(
      (error) => emit(state.copyWith(allSubCategoriesState: Async.failure(error))),
      (data) => emit(state.copyWith(allSubCategoriesState: Async.success(data))),
    );
  }

  Future<void> assignSubCategories(List<int> subCategoryIds) async {
    emit(state.copyWith(assignSubCategoriesState: const Async.loading()));
    final result = await _storeCategoriesRepository.assignSubCategories(subCategoryIds);
    result.fold(
      (error) => emit(state.copyWith(assignSubCategoriesState: Async.failure(error))),
      (_) {
        emit(state.copyWith(assignSubCategoriesState: const Async.success(unit)));
        getProfileSubCategories(); 
      },
    );
  }

  Future<void> changeSubCategoryStatus(int id) async {
    emit(state.copyWith(
      changeSubCategoryStatus: const Async.loading(),
      selectedCategoryIdState: Async.success(id),
    ));
    final result = await _storeCategoriesRepository.changeCategoriesStatus(id);
    result.fold(
      (error) => emit(state.copyWith(changeSubCategoryStatus: Async.failure(error))),
      (_) {
        final currentList = state.profileSubCategoriesState.data ?? [];
        final updatedList = currentList.map((e) {
          if (e.id == id) {
            return e.copyWith(isActive: !e.isActive);
          }
          return e;
        }).toList();
        emit(state.copyWith(
          changeSubCategoryStatus: const Async.success(unit),
          profileSubCategoriesState: Async.success(updatedList),
        ));
      },
    );
  }
}
