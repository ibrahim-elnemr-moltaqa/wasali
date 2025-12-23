import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_products_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_sizes_use_case.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down_cubit.dart';

class SizesDropDownCubit extends DropDownCubit<SizeEntity> {
  SizesDropDownCubit();

  final GetSizesUseCase _getSizesUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _getSizesUseCase(ManagementFetchParams());
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
