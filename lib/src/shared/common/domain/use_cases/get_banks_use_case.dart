import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/domain/repository/common_repository.dart';

@injectable
class GetBanksUseCase extends IUseCase<List<CommonEntity>, NoParams> {
  final CommonRepository _commonRepository;

  GetBanksUseCase(this._commonRepository);

  @override
  DomainServiceType<List<CommonEntity>> call(NoParams countryId) {
    return _commonRepository.getBanks();
  }
}
