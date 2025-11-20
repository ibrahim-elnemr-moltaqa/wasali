import 'package:equatable/equatable.dart';

class SpecializationEntity extends Equatable {
  final int id;
  final String name;

  const SpecializationEntity({
    required this.id,
    required this.name,
  });

  factory SpecializationEntity.fromJson(Map<String, dynamic> json) =>
      SpecializationEntity(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> get toMap => {"id": id, "name": name};

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
