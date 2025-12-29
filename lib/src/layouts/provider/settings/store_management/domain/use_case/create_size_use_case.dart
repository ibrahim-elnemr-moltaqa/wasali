import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';

@injectable
class CreateSizeUseCase extends IUseCase<SizeEntity, String> {
  final SizesRepository repository;

  CreateSizeUseCase(this.repository);

  @override
  DomainServiceType<SizeEntity> call(String countryId) {
    return repository.createSize(sizeName: countryId);
  }
}
