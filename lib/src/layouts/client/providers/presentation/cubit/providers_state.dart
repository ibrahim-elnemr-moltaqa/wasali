part of 'providers_cubit.dart';

class ProvidersState extends Equatable {
  const ProvidersState({
    this.subcategoriesState = const Async.loading(),
    this.providersState = const Async.loading(),
    this.selectedCategoryId = 0,
    this.searchQuery = '',
    this.selectedStatus,
    this.selectedFilter,
  });
  final Async<List<CategoryEntity>> subcategoriesState;
  final Async<List<ProviderModel>> providersState;
  final int selectedCategoryId;
  final String searchQuery;
  final ProviderStatusEnum? selectedStatus;
  final ProviderFilterEnum? selectedFilter;

  ProvidersState copyWith({
    Async<List<CategoryEntity>>? subcategoriesState,
    Async<List<ProviderModel>>? providersState,
    int? selectedCategoryId,
    String? searchQuery,
    ProviderStatusEnum? selectedStatus,
    ProviderFilterEnum? selectedFilter,
  }) {
    return ProvidersState(
      subcategoriesState: subcategoriesState ?? this.subcategoriesState,
      providersState: providersState ?? this.providersState,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props => [
        subcategoriesState,
        providersState,
        selectedCategoryId,
        searchQuery,
        selectedStatus,
        selectedFilter,
      ];
}
