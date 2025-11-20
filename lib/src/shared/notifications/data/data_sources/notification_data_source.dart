import '../../domain/use_cases/mark_notification_as_read_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../models/api_notification_model.dart';

abstract class NotificationDataSource {
  Future<ApiNotificationsResult> getNotifications(PaginatedInput params);
  Future<void> markAllNotifiactionAsRead();
  Future<void> markNotificationAsRead(MarkNotificationParams params);
}

@Injectable(as: NotificationDataSource)
class NotificationDataSourceImp implements NotificationDataSource {
  final DioHelper _dioHelper;
  NotificationDataSourceImp(this._dioHelper);
  @override
  Future<ApiNotificationsResult> getNotifications(PaginatedInput params) async {
    try {
      final response = await _dioHelper.get(
        url: "notifications/all-notifications",
        // queryParameters: params.toJson(),
      );

      return ApiNotificationsResult.fromJson(response['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAllNotifiactionAsRead() async {
    try {
      await _dioHelper.post(
        url: "notifications/mark-as-read",
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markNotificationAsRead(MarkNotificationParams params) async {
    try {
      await _dioHelper.post(
        url: "notifications/mark-as-read",
        body: params.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
