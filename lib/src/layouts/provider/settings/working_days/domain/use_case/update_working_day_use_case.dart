import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../../data/model/working_day_model.dart';
import '../repository/working_days_repository.dart';

@injectable
class UpdateWorkingDayUseCase extends IUseCase<Unit, WorkingDayModel> {
  final WorkingDaysRepository _repository;

  UpdateWorkingDayUseCase(this._repository);

  @override
  DomainServiceType<Unit> call(WorkingDayModel countryId) {
    return _repository.updateWorkingDay(countryId);
  }
}
