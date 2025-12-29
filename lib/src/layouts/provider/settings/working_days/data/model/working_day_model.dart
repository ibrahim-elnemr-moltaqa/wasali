class WorkingDayModel {
  final int? id;
  final int? userId;
  final int? day;
  final String? dayName;
  final String? from;
  final String? to;
  final String? method;

  WorkingDayModel({
    this.id,
    this.userId,
    this.day,
    this.dayName,
    this.from,
    this.to,
    this.method,
  });

  factory WorkingDayModel.fromJson(Map<String, dynamic> json) {
    return WorkingDayModel(
      id: json['id'],
      userId: json['user_id'],
      day: json['day'],
      dayName: json['day_name'],
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (method != null) '_method': method,
      'day': day,
      'from': from,
      'to': to,
    };
  }

  WorkingDayModel copyWith({
    String? method,
    int? id,
    int? userId,
    int? day,
    String? dayName,
    String? from,
    String? to,
  }) {
    return WorkingDayModel(
      method: method ?? this.method,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      day: day ?? this.day,
      dayName: dayName ?? this.dayName,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}
