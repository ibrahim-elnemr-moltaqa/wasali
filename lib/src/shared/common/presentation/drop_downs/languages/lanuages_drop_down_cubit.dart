import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import '../../../domain/entity/language_entity.dart';
import '../../../domain/use_cases/get_languages_use_case.dart';
import '../drop_down_cubit.dart';

class LanguagesDropDownCubit extends DropDownCubit<LanguageEntity> {
  LanguagesDropDownCubit();

  final GetLanguagesUseCase _getLanguagesUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _getLanguagesUseCase(NoParams());
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
