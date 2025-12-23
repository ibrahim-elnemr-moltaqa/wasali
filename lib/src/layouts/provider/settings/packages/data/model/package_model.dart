import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';

List<PackageModel> packageModelFromJson(List<dynamic> str) =>
    List<PackageModel>.from(str.map((x) => PackageModel.fromJson(x)));

class PackageModel extends PackageEntity {
  const PackageModel({
    required super.id,
    required super.name,
    required super.price,
    required super.duration,
    required super.description,
    required super.image,
    required super.createdAt,
    required super.nameAr,
    required super.nameEn,
    required super.descriptionAr,
    required super.descriptionEn,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] as int,
      name: json['name'] as String,
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
      description: json['description'] as String,
      descriptionAr: json['description_ar'] as String,
      descriptionEn: json['description_en'] as String,
      price: json['price'] as num,
      duration: json['num_days'] as int,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_ar': nameAr,
      'name_en': nameEn,
      'description': description,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'price': price,
      'num_days': duration,
      'image': image,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
