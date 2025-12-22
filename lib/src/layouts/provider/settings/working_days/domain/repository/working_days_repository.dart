import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import '../../data/model/working_day_model.dart';

abstract class WorkingDaysRepository {
  DomainServiceType<List<WorkingDayModel>> getWorkingDays();
  DomainServiceType<Unit> createWorkingDay(WorkingDayModel workingDay);
  DomainServiceType<Unit> updateWorkingDay(WorkingDayModel workingDay);
  DomainServiceType<Unit> deleteWorkingDay(int id);
}
