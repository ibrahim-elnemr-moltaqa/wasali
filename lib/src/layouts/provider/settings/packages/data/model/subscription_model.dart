import 'package:wasli/src/layouts/provider/settings/packages/data/model/package_model.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';

List<SubscriptionModel> subscriptionModelFromJson(List<dynamic> str) =>
    List<SubscriptionModel>.from(str.map((x) => SubscriptionModel.fromJson(x)));

class SubscriptionModel extends SubscriptionEntity {
  const SubscriptionModel({
    required super.id,
    required super.packageId,
    required super.userId,
    required super.price,
    required super.duration,
    required super.startDate,
    required super.endDate,
    required super.package,
    required super.createdAt,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'] as int,
      packageId: json['package_id'] as int,
      userId: json['user_id'] as int,
      price: json['price'] as num,
      duration: json['num_days'] as int,
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      package: PackageModel.fromJson(json['package']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'package_id': packageId,
      'user_id': userId,
      'price': price,
      'num_days': duration,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'package': (package as PackageModel).toJson(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}
