import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';

abstract class PackagesRepository {
  DomainServiceType<List<PackageEntity>> getPackages();
}
