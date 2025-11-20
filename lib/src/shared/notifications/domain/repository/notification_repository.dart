import '../use_cases/mark_notification_as_read_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import '../entities/notifications_result.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationsResult>> getNotifications(
      PaginatedInput params);

  Future<Either<Failure, void>> markAllNotificationAsRead();
  Future<Either<Failure, void>> markNotificationAsRead(
      MarkNotificationParams params);
}
