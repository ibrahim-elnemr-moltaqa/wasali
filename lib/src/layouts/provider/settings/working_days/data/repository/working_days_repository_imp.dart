import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../../domain/repository/working_days_repository.dart';
import '../model/working_day_model.dart';

@Injectable(as: WorkingDaysRepository)
class WorkingDaysRepositoryImpl implements WorkingDaysRepository {
  final DioHelper _dioHelper;

  WorkingDaysRepositoryImpl(this._dioHelper);

  @override
  DomainServiceType<List<WorkingDayModel>> getWorkingDays() async {
    return await failureCollect(() async {
      final response = await _dioHelper.get(url: 'working-days');
      final List data = response['data']['data'] ?? [];
      final result = data.map((e) => WorkingDayModel.fromJson(e)).toList();
      return Right(result);
    });
  }

  @override
  DomainServiceType<Unit> createWorkingDay(WorkingDayModel workingDay) async {
    return await failureCollect(() async {
      await _dioHelper.post(
        url: 'working-days',
        body: workingDay.toJson(),
      );
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> updateWorkingDay(WorkingDayModel workingDay) async {
    return await failureCollect(() async {
      await _dioHelper.post(
        url: 'working-days/${workingDay.id}',
        body: workingDay.toJson(),
      );
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> deleteWorkingDay(int id) async {
    return await failureCollect(() async {
      await _dioHelper.delete(url: 'working-days/$id');
      return const Right(unit);
    });
  }
}
