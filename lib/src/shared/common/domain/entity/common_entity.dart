import 'package:equatable/equatable.dart';

class CommonEntity extends Equatable {
  final int id;
  final String name;

  const CommonEntity({required this.id, required this.name});

  factory CommonEntity.initial() => const CommonEntity(id: 0, name: "");

  factory CommonEntity.fromJson(Map<String, dynamic> json) => CommonEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [id, name];
}
