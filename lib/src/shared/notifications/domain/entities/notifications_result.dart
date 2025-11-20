import 'package:equatable/equatable.dart';
import 'norification_entity.dart';

class NotificationsResult extends Equatable {
  final int count;
  final List<NotificationEntity> notifications;

  const NotificationsResult({
    required this.count,
    required this.notifications,
  });

  @override
  List<Object?> get props => [
        count,
        notifications,
      ];
}
