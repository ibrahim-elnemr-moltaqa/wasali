import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../repository/notification_repository.dart';

@Injectable()
class MarkAllNotificationsAsReadUseCase extends IUseCase<void, NoParams> {
  final NotificationRepository _repository;

  MarkAllNotificationsAsReadUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.markAllNotificationAsRead();
  }
}
