import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../../data/model/working_day_model.dart';
import '../repository/working_days_repository.dart';

@injectable
class CreateWorkingDayUseCase extends IUseCase<Unit, WorkingDayModel> {
  final WorkingDaysRepository _repository;

  CreateWorkingDayUseCase(this._repository);

  @override
  DomainServiceType<Unit> call(WorkingDayModel countryId) {
    return _repository.createWorkingDay(countryId);
  }
}
