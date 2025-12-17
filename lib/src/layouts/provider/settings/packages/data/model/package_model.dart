import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';

class PackageModel extends PackageEntity {
  const PackageModel({
    required super.id,
    required super.name,
    required super.price,
    required super.duration,
    required super.description,
    super.isPromoted,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as num,
      duration: json['duration'] as int,
      description: json['description'] as String,
      isPromoted: json['is_promoted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'duration': duration,
      'description': description,
      'is_promoted': isPromoted,
    };
  }
}
