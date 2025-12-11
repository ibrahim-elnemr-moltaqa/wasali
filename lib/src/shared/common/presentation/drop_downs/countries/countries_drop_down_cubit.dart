import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import '../../../domain/use_cases/get_countries_use_case.dart';
import '../drop_down_cubit.dart';

class CountriesDropDownCubit extends DropDownCubit<CommonEntity> {
  CountriesDropDownCubit();

  final GetCountriesUseCase _getCountriesUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _getCountriesUseCase(NoParams());
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
