import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/use_case/get_packages_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/use_case/get_subscriptions_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/use_case/subscribe_package_use_case.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_state.dart';

class PackagesSubscriptionsCubit extends Cubit<PackagesSubscriptionsState> {
  PackagesSubscriptionsCubit() : super(const PackagesSubscriptionsState());

  final _getPackagesUseCase = injector<GetPackagesUseCase>();
  final _getSubscriptionsUseCase = injector<GetSubscriptionsUseCase>();
  final _subscribePackage = injector<SubscribePackageUseCase>();

  Future<void> getPackages() async {
    emit(state.copyWith(packagesState: const Async.loading()));
    final result = await _getPackagesUseCase(NoParams());
    result.fold(
      (error) => emit(state.copyWith(packagesState: Async.failure(error))),
      (packages) =>
          emit(state.copyWith(packagesState: Async.success(packages))),
    );
  }

  Future<void> getSubscriptions() async {
    emit(state.copyWith(subscriptionsState: const Async.loading()));
    final result = await _getSubscriptionsUseCase(NoParams());
    result.fold(
      (error) => emit(state.copyWith(subscriptionsState: Async.failure(error))),
      (subscriptions) => emit(
          state.copyWith(subscriptionsState: Async.success(subscriptions))),
    );
  }

  Future<void> subscribePackage(int packageId) async {
    emit(state.copyWith(subscribePackageState: const Async.loading()));
    final result = await _subscribePackage(packageId);
    result.fold(
        (error) =>
            emit(state.copyWith(subscribePackageState: Async.failure(error))),
        (_) {
      emit(state.copyWith(
          subscribePackageState: const Async.successWithoutData()));
      getSubscriptions();
    });
  }
}
