import 'package:equatable/equatable.dart';

class EducationalYearEntity extends Equatable {
  final int id;
  final String name;

  const EducationalYearEntity({
    required this.id,
    required this.name,
  });

  factory EducationalYearEntity.fromJson(Map<String, dynamic> json) =>
      EducationalYearEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
