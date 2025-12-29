import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/shared/common/domain/repository/common_repository.dart';

@injectable
class GetSizesUseCase extends IUseCase<List<SizeEntity>, NoParams> {
  final CommonRepository _repository;

  GetSizesUseCase(this._repository);
  @override
  DomainServiceType<List<SizeEntity>> call(NoParams countryId) {
    return _repository.getSizes();
  }
}
