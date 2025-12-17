import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';

@injectable
class UpdateSizeUseCase extends IUseCase<SizeEntity, String> {
  final SizesRepository repository;

  UpdateSizeUseCase(this.repository);

  @override
  DomainServiceType<SizeEntity> call(String params) {
    return repository.updateSize(name: params);
  }
}
