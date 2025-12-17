import 'package:equatable/equatable.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/enum/size_status_enum.dart';

class SizeEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final int status;
  // final SizeStatusEnum statusEnum;
  final DateTime createdAt;

  const SizeEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.status,
    // required this.statusEnum,
    required this.createdAt,
  });

  SizeEntity copyWith({
    int? id,
    int? userId,
    String? name,
    int? status,
    DateTime? createdAt,
  }) {
    return SizeEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        status,
        // statusEnum,
        createdAt,
      ];
}