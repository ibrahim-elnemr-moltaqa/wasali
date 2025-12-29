import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_areas_use_case.dart';

import '../drop_down_cubit.dart';

class AreasDropDownCubit extends DropDownCubit<CommonEntity> {
  AreasDropDownCubit({this.countryId});
  final int? countryId;

  final GetAreasUseCase _areasUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _areasUseCase(countryId);
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
