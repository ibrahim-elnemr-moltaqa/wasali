import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';

@injectable
class GetSizeUseCase extends IUseCase<SizeEntity, int> {
  final SizesRepository repository;

  GetSizeUseCase(this.repository);

  @override
  DomainServiceType<SizeEntity> call(int countryId) {
    return repository.getSize(sizeId: countryId);
  }
}
