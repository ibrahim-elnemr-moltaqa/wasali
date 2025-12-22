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

  Future<void> getProfileSubCategories() async {
    emit(state.copyWith(profileSubCategoriesState: const Async.loading()));
    final result = await _storeCategoriesRepository.getProfileSubCategories();
    result.fold(
      (error) => emit(state.copyWith(profileSubCategoriesState: Async.failure(error))),
      (data) => emit(state.copyWith(profileSubCategoriesState: Async.success(data))),
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
}
