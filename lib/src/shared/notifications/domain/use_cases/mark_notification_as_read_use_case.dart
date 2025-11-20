import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../repository/notification_repository.dart';

@Injectable()
class MarkNotificationAsReadUseCase
    extends IUseCase<void, MarkNotificationParams> {
  final NotificationRepository _repository;

  MarkNotificationAsReadUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(MarkNotificationParams params) async {
    return await _repository.markNotificationAsRead(params);
  }
}

class MarkNotificationParams {
  final String notificationID;
  MarkNotificationParams({required this.notificationID});
  Map<String, dynamic> toMap() => {
        "notification_id": notificationID,
      };
}
