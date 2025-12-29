import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../../data/model/working_day_model.dart';
import '../repository/working_days_repository.dart';

@injectable
class GetWorkingDaysUseCase extends IUseCase<List<WorkingDayModel>, NoParams> {
  final WorkingDaysRepository _repository;

  GetWorkingDaysUseCase(this._repository);

  @override
  DomainServiceType<List<WorkingDayModel>> call(NoParams countryId) {
    return _repository.getWorkingDays();
  }
}
