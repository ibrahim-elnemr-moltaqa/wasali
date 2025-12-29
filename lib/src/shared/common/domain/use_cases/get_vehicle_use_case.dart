import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/domain/repository/common_repository.dart';

@injectable
class GetVehicleUseCase extends IUseCase<List<CommonEntity>, NoParams> {
  final CommonRepository _commonRepository;

  GetVehicleUseCase(this._commonRepository);

  @override
  DomainServiceType<List<CommonEntity>> call(NoParams countryId) {
    return _commonRepository.getVehicles();
  }
}
