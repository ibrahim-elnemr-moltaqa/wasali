import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/domain/use_cases/get_banks_use_case.dart';

import '../drop_down_cubit.dart';

class BanksDropDownCubit extends DropDownCubit<CommonEntity> {
  BanksDropDownCubit();

  final GetBanksUseCase _getBanksUseCase = injector();

  @override
  void fetch() async {
    if (state.isSuccess) return;
    emit(const Async.loading());
    final result = await _getBanksUseCase(NoParams());
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
