import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_main_categories_use_case.dart';

import '../../../../../../core/core.dart';
import '../../domain/usecases/get_home_banners_usecase.dart';
import '../../domain/usecases/get_home_offers_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  final GetHomeBannersUseCase _getHomeBannersUseCase = injector();
  final GetHomeOffersUseCase _getHomeOffersUseCase = injector();
  final GetMainCategoriesUseCase _getMainCategoriesUseCase = injector();

  Future<void> getHomeData() async {
    await Future.wait([
      getBanners(),
      getOffers(),
      getCategories(),
    ]);
  }

  Future<void> getBanners() async {
    emit(state.copyWith(bannersState: const Async.loading()));
    final result = await _getHomeBannersUseCase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(bannersState: Async.failure(failure))),
      (data) => emit(state.copyWith(bannersState: Async.success(data))),
    );
  }

  Future<void> getOffers() async {
    emit(state.copyWith(offersState: const Async.loading()));
    final result = await _getHomeOffersUseCase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(offersState: Async.failure(failure))),
      (data) => emit(state.copyWith(offersState: Async.success(data))),
    );
  }

  Future<void> getCategories() async {
    emit(state.copyWith(categoriesState: const Async.loading()));
    final result = await _getMainCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(categoriesState: Async.failure(failure))),
      (data) => emit(state.copyWith(categoriesState: Async.success(data))),
    );
  }
}
