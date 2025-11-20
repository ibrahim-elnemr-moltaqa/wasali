part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final Async<List<NotificationEntity>> notificationsState;
  final Async<int> notificationsCountState;
  final Async<void> markNotificationsAsReadState;

  const NotificationsState({
    required this.notificationsState,
    required this.notificationsCountState,
    required this.markNotificationsAsReadState,
  });

  const NotificationsState.initial()
      : this(
          notificationsState: const Async.initial(),
          notificationsCountState: const Async.initial(),
          markNotificationsAsReadState: const Async.initial(),
        );

  NotificationsState copyWith({
    Async<List<NotificationEntity>>? notificationsState,
    Async<int>? notificationsCountState,
    Async<void>? markNotificationsAsReadState,
  }) {
    return NotificationsState(
      notificationsState: notificationsState ?? this.notificationsState,
      notificationsCountState:
          notificationsCountState ?? this.notificationsCountState,
      markNotificationsAsReadState:
          markNotificationsAsReadState ?? this.markNotificationsAsReadState,
    );
  }

  @override
  List<Object?> get props => [
        notificationsState,
        notificationsCountState,
        markNotificationsAsReadState,
      ];
}
