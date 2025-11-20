import '../domain/use_cases/mark_notification_as_read_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../../core/di/di.dart';
import '../domain/entities/norification_entity.dart';
import '../domain/use_cases/get_notifications_use_case.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState.initial()) {
    _loadUseCases();
  }

  static NotificationsCubit of(BuildContext context) =>
      BlocProvider.of<NotificationsCubit>(context);

  late final GetNotificationsUseCase _getNotificationsUseCase;
  // late final MarkAllNotificationsAsReadUseCase
  //     _markAllNotificationsAsReadUseCase;
  late final MarkNotificationAsReadUseCase _markNotificationAsReadUseCase;

  void _loadUseCases() {
    _getNotificationsUseCase = injector();
    // _markAllNotificationsAsReadUseCase = injector();
    _markNotificationAsReadUseCase = injector();
  }

  void getNotifications(int page) async {
    emit(state.copyWith(notificationsState: const Async.loading()));

    final params = PaginatedInput(
      page: page,
    );

    final result = await _getNotificationsUseCase(params);

    result.fold(
      (left) {
        emit(
          state.copyWith(
            notificationsState: Async.failure(left),
          ),
        );
        // if (state.markNotificationsAsReadState.isFailure) {
        //   markAllNotificationAsRead();
        // }
      },
      (data) {
        emit(
          state.copyWith(
            notificationsState: Async.success(data.notifications),
            notificationsCountState: Async.success(data.count),
          ),
        );
      },
    );
  }

  // void markAllNotificationAsRead() async {
  //   emit(state.copyWith(markNotificationsAsReadState: const Async.loading()));
  //   final result = await _markAllNotificationsAsReadUseCase(NoParams());
  //   result.fold((left) {
  //     emit(state.copyWith(markNotificationsAsReadState: Async.failure(left)));
  //   }, (_) {
  //     emit(state.copyWith(
  //         markNotificationsAsReadState: const Async.successWithoutData(),
  //         notificationsCountState: const Async.initial()));
  //     emit(state.copyWith(markNotificationsAsReadState: const Async.initial()));
  //   });
  // }

  void markNotificationAsRead(NotificationEntity notification) async {
    if (notification.isRead) {
      return;
    }
    // emit(state.copyWith(markNotificationsAsReadState: const Async.loading()));
    final result = await _markNotificationAsReadUseCase(
        MarkNotificationParams(notificationID: notification.id));
    result.fold((left) {
      emit(state.copyWith(markNotificationsAsReadState: Async.failure(left)));
    }, (_) {
      getNotifications(1);
      // emit(state.copyWith(
      //     markNotificationsAsReadState: const Async.successWithoutData(),
      //     notificationsCountState: const Async.initial()));
      // emit(state.copyWith(markNotificationsAsReadState: const Async.initial()));
    });
  }
}
