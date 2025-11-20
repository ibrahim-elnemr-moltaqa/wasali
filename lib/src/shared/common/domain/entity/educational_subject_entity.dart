import 'package:equatable/equatable.dart';

class EducationalSubjectEntity extends Equatable {
  final int id;
  final String name;

  const EducationalSubjectEntity({
    required this.id,
    required this.name,
  });

  factory EducationalSubjectEntity.fromJson(Map<String, dynamic> json) =>
      EducationalSubjectEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
