import 'package:equatable/equatable.dart';

class PackageEntity extends Equatable {
  final int id;
  final String name;
  final String nameAr;
  final String nameEn;
  final String description;
  final String descriptionAr;
  final String descriptionEn;
  final int duration;
  final num price;
  final String image;
  final DateTime createdAt;
  final bool isPromoted;

  const PackageEntity({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.description,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.duration,
    required this.price,
    required this.image,
    required this.createdAt,
    this.isPromoted = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        nameAr,
        nameEn,
        description,
        descriptionAr,
        descriptionEn,
        duration,
        price,
        image,
        createdAt,
        isPromoted,
      ];
}
