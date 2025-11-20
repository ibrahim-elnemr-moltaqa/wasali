import 'package:equatable/equatable.dart';

class EducationalStageEntity extends Equatable {
  final int id;
  final String name;

  const EducationalStageEntity({
    required this.id,
    required this.name,
  });

  factory EducationalStageEntity.fromJson(Map<String, dynamic> json) =>
      EducationalStageEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
