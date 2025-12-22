import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String nameAr;
  final String nameEn;
  final bool isActive;
  final String? image;
  final DateTime createdAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.isActive,
    this.image,
    required this.createdAt,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
      isActive: json['is_active'] as bool,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  CategoryEntity.example()
      : id = 1,
        name = 'name',
        nameAr = 'nameAr',
        nameEn = 'nameEn',
        isActive = true,
        image = 'image',
        createdAt = DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_ar': nameAr,
      'name_en': nameEn,
      'is_active': isActive,
      'image': image,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        nameAr,
        nameEn,
        isActive,
        image,
        createdAt,
      ];
}
