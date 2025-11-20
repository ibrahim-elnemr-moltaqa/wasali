import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

enum NotificationType {
  coupon("coupon"),
  adminNotification("admin_notification"),
  user("user"),
  categorySubscription("category_subscription"),
  game("game"),
  contactUs("contact_us"),
  unkown("");

  final String json;

  const NotificationType(this.json);

  factory NotificationType.fromJson(String json) =>
      NotificationType.values.firstWhereOrNull(
        (element) => element.json == json,
      ) ??
      NotificationType.unkown;
}

class NotificationEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final String createdAt;
  final NotificationType notificationType;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.notificationType,
    required this.isRead,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        createdAt,
        notificationType,
        isRead,
      ];
}
