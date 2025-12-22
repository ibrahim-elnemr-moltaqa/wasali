part of 'store_categories_cubit.dart';

class StoreCategoriesState extends Equatable {
  final Async<List<CategoryEntity>> profileSubCategoriesState;
  final Async<List<CategoryEntity>> allSubCategoriesState;
  final Async<Unit> assignSubCategoriesState;

  const StoreCategoriesState({
    required this.profileSubCategoriesState,
    required this.allSubCategoriesState,
    required this.assignSubCategoriesState,
  });

  const StoreCategoriesState.initial()
      : profileSubCategoriesState = const Async.initial(),
        allSubCategoriesState = const Async.initial(),
        assignSubCategoriesState = const Async.initial();

  StoreCategoriesState copyWith({
    Async<List<CategoryEntity>>? profileSubCategoriesState,
    Async<List<CategoryEntity>>? allSubCategoriesState,
    Async<Unit>? assignSubCategoriesState,
  }) {
    return StoreCategoriesState(
      profileSubCategoriesState:
          profileSubCategoriesState ?? this.profileSubCategoriesState,
      allSubCategoriesState:
          allSubCategoriesState ?? this.allSubCategoriesState,
      assignSubCategoriesState:
          assignSubCategoriesState ?? this.assignSubCategoriesState,
    );
  }

  @override
  List<Object?> get props => [
        profileSubCategoriesState,
        allSubCategoriesState,
        assignSubCategoriesState,
      ];
}
