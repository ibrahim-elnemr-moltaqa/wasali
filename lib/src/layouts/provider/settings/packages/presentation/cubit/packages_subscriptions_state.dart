import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';

class PackagesSubscriptionsState extends Equatable {
  final Async<List<PackageEntity>> packagesState;
  final Async<List<SubscriptionEntity>> subscriptionsState;
  final Async<void> subscribePackageState;

  const PackagesSubscriptionsState({
    this.packagesState = const Async.initial(),
    this.subscriptionsState = const Async.initial(),
    this.subscribePackageState = const Async.initial(),
  });

  PackagesSubscriptionsState copyWith({
    Async<List<PackageEntity>>? packagesState,
    Async<List<SubscriptionEntity>>? subscriptionsState,
    Async<void>? subscribePackageState,
  }) {
    return PackagesSubscriptionsState(
      packagesState: packagesState ?? this.packagesState,
      subscriptionsState: subscriptionsState ?? this.subscriptionsState,
      subscribePackageState:
          subscribePackageState ?? this.subscribePackageState,
    );
  }

  @override
  List<Object?> get props =>
      [packagesState, subscriptionsState, subscribePackageState];
}
