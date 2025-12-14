import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_main_categories_use_case.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down_cubit.dart';

class MainCategoriesDropDownCubit extends DropDownCubit<CategoryEntity> {
  MainCategoriesDropDownCubit();

  final GetMainCategoriesUseCase _mainCategoriesUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _mainCategoriesUseCase(NoParams());
    result.fold(
      (failer) {
        emit(Async.failure(failer));
      },
      (data) {
        emit(Async.success(data));
      },
    );
  }
}
