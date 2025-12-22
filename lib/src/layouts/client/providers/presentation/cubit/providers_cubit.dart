import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_filter_enum.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';
import 'package:wasli/src/layouts/client/providers/domain/use_cases/get_providers_use_case.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_sub_categories_use_case.dart';

part 'providers_state.dart';

class ProvidersCubit extends Cubit<ProvidersState> {
  ProvidersCubit() : super(const ProvidersState());

  final GetSubCategoriesUseCase getSubCategoriesUseCase = injector();
  final GetProvidersUseCase getProvidersUseCase = injector();

  Future<void> init(int categoryId) async {
    emit(state.copyWith(selectedCategoryId: categoryId));
    await getSubCategories(categoryId);
    await _fetchProviders();
  }

  Future<void> updateSearchQuery(String query) async {
    emit(state.copyWith(searchQuery: query));
    await _fetchProviders();
  }

  Future<void> updateCategory(int categoryId) async {
    emit(state.copyWith(selectedCategoryId: categoryId));
    await _fetchProviders();
  }

  Future<void> updateStatus(ProviderStatusEnum? status) async {
    emit(state.copyWith(selectedStatus: status));
    await _fetchProviders();
  }

  Future<void> updateFilter(ProviderFilterEnum filter) async {
    if (state.selectedFilter == filter) {
      emit(ProvidersState(
        subcategoriesState: state.subcategoriesState,
        providersState: state.providersState,
        selectedCategoryId: state.selectedCategoryId,
        searchQuery: state.searchQuery,
        selectedStatus: state.selectedStatus,
      ));
    } else {
      emit(state.copyWith(selectedFilter: filter));
    }
    await _fetchProviders();
  }

  Future<void> _fetchProviders() async {
    emit(state.copyWith(providersState: const Async.loading()));
    final result = await getProvidersUseCase(GetProvidersParams(
      categoryId: state.selectedCategoryId,
      query: state.searchQuery,
      status: state.selectedStatus == ProviderStatusEnum.all
          ? null
          : state.selectedStatus,
      filter: state.selectedFilter,
    ));
    result.fold(
      (failure) {
        emit(state.copyWith(providersState: Async.failure(failure)));
      },
      (data) {
        emit(state.copyWith(providersState: Async.success(data)));
      },
    );
  }

  Future<void> getSubCategories(int? categoryId) async {
    emit(state.copyWith(subcategoriesState: const Async.loading()));
    final result = await getSubCategoriesUseCase(categoryId);
    result.fold(
      (failure) {
        emit(state.copyWith(subcategoriesState: Async.failure(failure)));
      },
      (data) {
        emit(state.copyWith(subcategoriesState: Async.success(data)));
      },
    );
  }
}
