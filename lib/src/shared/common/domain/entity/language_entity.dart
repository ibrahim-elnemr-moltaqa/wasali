import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final int id;
  final String name;

  const LanguageEntity({
    required this.id,
    required this.name,
  });

  factory LanguageEntity.fromJson(Map<String, dynamic> json) => LanguageEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
