import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';

@injectable
class GetSizesUseCase extends IUseCase<List<SizeEntity>, NoParams> {
  final SizesRepository storeManagementRepository;

  GetSizesUseCase(this.storeManagementRepository);

  @override
  DomainServiceType<List<SizeEntity>> call(NoParams params) {
    return storeManagementRepository.getSizes();
  }
}
