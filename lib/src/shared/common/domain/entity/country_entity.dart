import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final int id;
  final String name;

  const CountryEntity({
    required this.id,
    required this.name,
  });

  factory CountryEntity.fromJson(Map<String, dynamic> json) => CountryEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
