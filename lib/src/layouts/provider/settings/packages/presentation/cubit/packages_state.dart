import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';

class PackagesState extends Equatable {
  final Async<List<PackageEntity>> packagesState;

  const PackagesState({
    this.packagesState = const Async.initial(),
  });

  PackagesState copyWith({
    Async<List<PackageEntity>>? packagesState,
  }) {
    return PackagesState(
      packagesState: packagesState ?? this.packagesState,
    );
  }

  @override
  List<Object?> get props => [packagesState];
}
