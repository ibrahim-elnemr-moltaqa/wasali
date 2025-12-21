import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_sub_categories_use_case.dart';

part 'providers_state.dart';

class ProvidersCubit extends Cubit<ProvidersState> {
  ProvidersCubit() : super(const ProvidersState());

  final GetSubCategoriesUseCase getSubCategoriesUseCase = injector();

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
