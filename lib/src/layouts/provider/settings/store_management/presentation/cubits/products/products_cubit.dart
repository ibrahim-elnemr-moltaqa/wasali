import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/product_body.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/change_product_status_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/create_product_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/delete_product_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_products_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/update_product_use_case.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsState.initial());

  final GetProductsUseCase _getProductsUseCase = injector();
  final CreateProductUseCase _createProductUseCase = injector();
  final UpdateProductUseCase _updateProductUseCase = injector();
  final DeleteProductUseCase _deleteProductUseCase = injector();
  final ChangeProductStatusUseCase _changeProductStatusUseCase = injector();

  Future<void> getProducts({String? name, int? active}) async {
    final activeVal = active ?? state.activeFilter;
    emit(state.copyWith(
      productsState: const Async.loading(),
      activeFilter: active,
    ));
    final result = await _getProductsUseCase(
        ManagementFetchParams(name: name, active: activeVal));
    result.fold((error) {
      emit(state.copyWith(productsState: Async.failure(error)));
    }, (products) {
      emit(state.copyWith(productsState: Async.success(products)));
    });
  }

  Future<void> createProduct(ProductBody body) async {
    emit(state.copyWith(createProductState: const Async.loading()));
    final result = await _createProductUseCase(body);
    result.fold((error) {
      emit(state.copyWith(createProductState: Async.failure(error)));
    }, (product) {
      final currentList = state.productsState.data ?? [];
      emit(state.copyWith(
        createProductState: Async.success(product),
        productsState: Async.success([product, ...currentList]),
      ));
    });
  }

  Future<void> updateProduct(ProductBody body) async {
    emit(state.copyWith(updateProductState: const Async.loading()));
    final result = await _updateProductUseCase(body);
    result.fold((error) {
      emit(state.copyWith(updateProductState: Async.failure(error)));
    }, (product) {
      final currentList = state.productsState.data ?? [];
      final updatedList =
          currentList.map((e) => e.id == product.id ? product : e).toList();
      emit(state.copyWith(
        updateProductState: Async.success(product),
        productsState: Async.success(updatedList),
      ));
    });
  }

  Future<void> deleteProduct(int id) async {
    emit(state.copyWith(
      deleteProductState: const Async.loading(),
      selectedProductIdState: Async.success(id),
    ));
    final result = await _deleteProductUseCase(id);
    result.fold((error) {
      emit(state.copyWith(deleteProductState: Async.failure(error)));
    }, (_) {
      final currentList = state.productsState.data ?? [];
      final updatedList = currentList.where((e) => e.id != id).toList();
      emit(state.copyWith(
        deleteProductState: const Async.success(unit),
        productsState: Async.success(updatedList),
      ));
    });
  }

  Future<void> changeProductStatus(int id) async {
    emit(state.copyWith(
      changeProductStatusState: const Async.loading(),
      selectedProductIdState: Async.success(id),
    ));
    final result = await _changeProductStatusUseCase(id);
    result.fold((error) {
      emit(state.copyWith(changeProductStatusState: Async.failure(error)));
    }, (_) {
      final currentList = state.productsState.data ?? [];
      final updatedList = currentList.map((e) {
        if (e.id == id) {
          return e.copyWith(status: e.status == 1 ? 0 : 1);
        }
        return e;
      }).toList();
      emit(state.copyWith(
        changeProductStatusState: const Async.success(unit),
        productsState: Async.success(updatedList),
      ));
    });
  }
}
