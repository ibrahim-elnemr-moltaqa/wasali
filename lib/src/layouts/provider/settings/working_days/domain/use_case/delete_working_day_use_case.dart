import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../repository/working_days_repository.dart';

@injectable
class DeleteWorkingDayUseCase extends IUseCase<Unit, int> {
  final WorkingDaysRepository _repository;

  DeleteWorkingDayUseCase(this._repository);

  @override
  DomainServiceType<Unit> call(int countryId) {
    return _repository.deleteWorkingDay(countryId);
  }
}
