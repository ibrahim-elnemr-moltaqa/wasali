import 'package:equatable/equatable.dart';

class PackageEntity extends Equatable {
  final int id;
  final String name;
  final num price;
  final int duration; // in months
  final String description;
  final bool isPromoted;

  const PackageEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.description,
    this.isPromoted = false,
  });

  @override
  List<Object?> get props => [id, name, price, duration, description, isPromoted];
}
