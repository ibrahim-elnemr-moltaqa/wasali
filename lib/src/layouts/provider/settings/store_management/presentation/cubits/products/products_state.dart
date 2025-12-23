part of 'products_cubit.dart';

class ProductsState extends Equatable {
  final Async<List<ProductEntity>> productsState;
  final Async<ProductEntity> createProductState;
  final Async<ProductEntity> updateProductState;
  final Async<Unit> deleteProductState;
  final Async<Unit> changeProductStatusState;
  final Async<int> selectedProductIdState;
  final int? activeFilter;

  const ProductsState({
    required this.productsState,
    required this.createProductState,
    required this.updateProductState,
    required this.deleteProductState,
    required this.changeProductStatusState,
    required this.selectedProductIdState,
    this.activeFilter,
  });

  const ProductsState.initial()
      : productsState = const Async.initial(),
        createProductState = const Async.initial(),
        updateProductState = const Async.initial(),
        deleteProductState = const Async.initial(),
        changeProductStatusState = const Async.initial(),
        selectedProductIdState = const Async.initial(),
        activeFilter = 0;
        

  ProductsState copyWith({
    Async<List<ProductEntity>>? productsState,
    Async<ProductEntity>? createProductState,
    Async<ProductEntity>? updateProductState,
    Async<Unit>? deleteProductState,
    Async<Unit>? changeProductStatusState,
    Async<int>? selectedProductIdState,
    int? activeFilter,
  }) {
    return ProductsState(
      productsState: productsState ?? this.productsState,
      createProductState: createProductState ?? this.createProductState,
      updateProductState: updateProductState ?? this.updateProductState,
      deleteProductState: deleteProductState ?? this.deleteProductState,
      changeProductStatusState:
          changeProductStatusState ?? this.changeProductStatusState,
      selectedProductIdState:
          selectedProductIdState ?? this.selectedProductIdState,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }

  @override
  List<Object?> get props => [
        productsState,
        createProductState,
        updateProductState,
        deleteProductState,
        changeProductStatusState,
        selectedProductIdState,
        activeFilter,
      ];
}
