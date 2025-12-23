import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/use_case/get_products_use_case.dart';

@injectable
class GetSizesUseCase extends IUseCase<List<SizeEntity>, ManagementFetchParams> {
  final SizesRepository storeManagementRepository;

  GetSizesUseCase(this.storeManagementRepository);

  @override
  DomainServiceType<List<SizeEntity>> call(ManagementFetchParams params) {
    return storeManagementRepository.getSizes(
        name: params.name, active: params.active);
  }
}
