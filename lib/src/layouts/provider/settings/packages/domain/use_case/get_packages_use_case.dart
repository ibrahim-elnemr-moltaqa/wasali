import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/repository/packages_repository.dart';

@injectable
class GetPackagesUseCase extends IUseCase<List<PackageEntity>, NoParams> {
  final PackagesRepository _repository;

  GetPackagesUseCase(this._repository);

  @override
  DomainServiceType<List<PackageEntity>> call(NoParams params) {
    return _repository.getPackages();
  }
}
