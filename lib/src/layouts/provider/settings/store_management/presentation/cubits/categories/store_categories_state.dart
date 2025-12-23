part of 'store_categories_cubit.dart';

class StoreCategoriesState extends Equatable {
  final Async<List<CategoryEntity>> profileSubCategoriesState;
  final Async<List<CategoryEntity>> allSubCategoriesState;
  final Async<Unit> assignSubCategoriesState;
  final Async<Unit> changeSubCategoryStatus;
  final Async<int> selectedCategoryIdState;
  final int? activeFilter;

  const StoreCategoriesState({
    required this.profileSubCategoriesState,
    required this.allSubCategoriesState,
    required this.assignSubCategoriesState,
    required this.changeSubCategoryStatus,
    required this.selectedCategoryIdState,
    this.activeFilter,
  });

  const StoreCategoriesState.initial()
      : profileSubCategoriesState = const Async.initial(),
        allSubCategoriesState = const Async.initial(),
        assignSubCategoriesState = const Async.initial(),
        changeSubCategoryStatus = const Async.initial(),
        selectedCategoryIdState = const Async.initial(),
        activeFilter = 0;


  StoreCategoriesState copyWith({
    Async<List<CategoryEntity>>? profileSubCategoriesState,
    Async<List<CategoryEntity>>? allSubCategoriesState,
    Async<Unit>? assignSubCategoriesState,
    Async<Unit>? changeSubCategoryStatus,
    Async<int>? selectedCategoryIdState,
    int? activeFilter,
  }) {
    return StoreCategoriesState(
      profileSubCategoriesState:
          profileSubCategoriesState ?? this.profileSubCategoriesState,
      allSubCategoriesState:
          allSubCategoriesState ?? this.allSubCategoriesState,
      assignSubCategoriesState:
          assignSubCategoriesState ?? this.assignSubCategoriesState,
      changeSubCategoryStatus:
          changeSubCategoryStatus ?? this.changeSubCategoryStatus,
      selectedCategoryIdState:
          selectedCategoryIdState ?? this.selectedCategoryIdState,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }

  @override
  List<Object?> get props => [
        profileSubCategoriesState,
        allSubCategoriesState,
        assignSubCategoriesState,
        changeSubCategoryStatus,
        selectedCategoryIdState,
        activeFilter,
      ];
}
