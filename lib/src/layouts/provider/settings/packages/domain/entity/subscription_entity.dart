import 'package:equatable/equatable.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';

class SubscriptionEntity extends Equatable {
  final int id;
  final int packageId;
  final int userId;
  final num price;
  final int duration;
  final DateTime startDate;
  final DateTime endDate;
  final PackageEntity package;
  final DateTime createdAt;

  const SubscriptionEntity({
    required this.id,
    required this.packageId,
    required this.userId,
    required this.price,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.package,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        packageId,
        userId,
        price,
        duration,
        startDate,
        endDate,
        package,
        createdAt,
      ];
}
