import '../../domain/entities/norification_entity.dart';
import '../../domain/entities/notifications_result.dart';
import 'api_notification_model.dart';

extension NotificationResultExt on ApiNotificationsResult {
  NotificationsResult get map => NotificationsResult(
        count: count ?? 0,
        notifications: notifications
            .map(
              (data) => data.map,
            )
            .toList(),
      );
}

extension ApiNotificationModelExt on ApiNotificationModel {
  NotificationEntity get map => NotificationEntity(
        id: id ?? "",
        title: title ?? "",
        body: body ?? "",
        createdAt: createdAt ?? '',
        notificationType: NotificationType.fromJson(notificationType ?? ''),
        isRead: isRead ?? false,
      );
}
