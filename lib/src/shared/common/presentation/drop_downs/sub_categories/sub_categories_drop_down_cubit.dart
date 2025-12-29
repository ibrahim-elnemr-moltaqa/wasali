import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_sub_categories_use_case.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down_cubit.dart';

class SubCategoriesDropDownCubit extends DropDownCubit<CategoryEntity> {
  SubCategoriesDropDownCubit({this.categoryId, this.endPoint});
  final int? categoryId;
  final String? endPoint;

  final GetSubCategoriesUseCase _subCategoriesUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _subCategoriesUseCase(
      GetSubCategoriesParams(categoryId: categoryId, endPoint: endPoint),
    );
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
