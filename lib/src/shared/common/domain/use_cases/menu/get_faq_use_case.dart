import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../../entity/menu/faq_entity.dart';
import '../../repository/menu_common_repository.dart';

@Injectable()
class GetFaqUseCase extends IUseCase<List<FaqEntity>, NoParams> {
  final MenuCommonRepository _repository;

  GetFaqUseCase(this._repository);

  @override
  DomainServiceType<List<FaqEntity>> call(NoParams countryId) async {
    return await _repository.getFaqList();
  }
}
