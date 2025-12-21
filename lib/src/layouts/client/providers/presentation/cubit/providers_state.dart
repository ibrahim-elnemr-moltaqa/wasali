part of 'providers_cubit.dart';

class ProvidersState extends Equatable {
  const ProvidersState({
    this.subcategoriesState = const Async.loading(),
  });
  final Async<List<CategoryEntity>> subcategoriesState;

  ProvidersState copyWith({
    Async<List<CategoryEntity>>? subcategoriesState,
  }) {
    return ProvidersState(
      subcategoriesState: subcategoriesState ?? this.subcategoriesState,
    );
  }

  @override
  List<Object?> get props => [subcategoriesState];
}
