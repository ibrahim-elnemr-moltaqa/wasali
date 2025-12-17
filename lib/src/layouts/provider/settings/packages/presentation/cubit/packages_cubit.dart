import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';

import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/use_case/get_packages_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit() : super(const PackagesState());

  final _getPackagesUseCase = injector<GetPackagesUseCase>();

  Future<void> getPackages() async {
    emit(state.copyWith(packagesState: const Async.loading()));
    final result = await _getPackagesUseCase(NoParams());
    result.fold(
      (error) => emit(state.copyWith(packagesState: Async.failure(error))),
      (packages) => emit(state.copyWith(packagesState: Async.success(packages))),
    );
  }
}
