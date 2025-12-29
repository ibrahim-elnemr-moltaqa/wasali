import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../entities/notifications_result.dart';
import '../repository/notification_repository.dart';

@Injectable()
class GetNotificationsUseCase
    extends IUseCase<NotificationsResult, PaginatedInput> {
  final NotificationRepository _repository;

  GetNotificationsUseCase(this._repository);

  @override
  Future<Either<Failure, NotificationsResult>> call(
      PaginatedInput countryId) async {
    return await _repository.getNotifications(countryId);
  }
}
