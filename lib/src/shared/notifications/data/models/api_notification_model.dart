class ApiNotificationsResult {
  final int? count;
  final List<ApiNotificationModel> notifications;

  const ApiNotificationsResult(
      {required this.count, required this.notifications});

  factory ApiNotificationsResult.fromJson(Map<String, dynamic> json) {
    final List notificationsJson = json["notifications"] ?? [];
    return ApiNotificationsResult(
      count: json["unread_count"],
      notifications: List<ApiNotificationModel>.from(notificationsJson
          .map((json) => ApiNotificationModel.fromJson(json))
          .toList()),
    );
  }
}

class ApiNotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final bool? isRead;
  final String? createdAt;
  final String? notificationType;

  const ApiNotificationModel({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
    this.notificationType,
  });

  factory ApiNotificationModel.fromJson(Map<String, dynamic> json) =>
      ApiNotificationModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        isRead: json["is_read"] ?? false,
        notificationType: json["notification_type"],
        createdAt: json["created_at"] ?? '',
        // == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
      );
}
