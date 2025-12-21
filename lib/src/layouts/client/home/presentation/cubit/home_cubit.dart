import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/di/di.dart';

import '../../../../../../core/core.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  final GetHomeDataUseCase _getHomeDataUseCase = injector();

  Future<void> getHomeData() async {
    emit(state.copyWith(homeDataState: const Async.loading()));

    final result = await _getHomeDataUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(homeDataState: Async.failure(failure))),
      (data) => emit(state.copyWith(homeDataState: Async.success(data))),
    );
  }
}
