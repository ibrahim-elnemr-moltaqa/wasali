import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/city_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_cities_use_case.dart';
import '../drop_down_cubit.dart';

class CitiesDropDownCubit extends DropDownCubit<CityEntity> {
  CitiesDropDownCubit();

  final GetCitiesUseCase _getCitiesUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _getCitiesUseCase(NoParams());
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
