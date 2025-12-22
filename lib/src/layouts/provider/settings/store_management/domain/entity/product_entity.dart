import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String description;
  final dynamic subCategoryId;
  final dynamic price;
  final String? image;
  final String? additionalImage;
  final int? status;
  final DateTime createdAt;
  final List<ProductSizeEntity>? sizes;

  const ProductEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.subCategoryId,
    required this.price,
    this.image,
    this.additionalImage,
    this.status,
    required this.createdAt,
    this.sizes,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        description,
        subCategoryId,
        price,
        image,
        additionalImage,
        status,
        createdAt,
        sizes,
      ];

  ProductEntity copyWith({
    int? id,
    int? userId,
    String? name,
    String? description,
    dynamic subCategoryId,
    dynamic price,
    String? image,
    String? additionalImage,
    int? status,
    DateTime? createdAt,
    List<ProductSizeEntity>? sizes,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      price: price ?? this.price,
      image: image ?? this.image,
      additionalImage: additionalImage ?? this.additionalImage,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      sizes: sizes ?? this.sizes,
    );
  }
}

class ProductSizeEntity extends Equatable {
  final int id;
  final int productId;
  final int sizeId;
  final SizeDataEntity? size;

  const ProductSizeEntity({
    required this.id,
    required this.productId,
    required this.sizeId,
    this.size,
  });

  @override
  List<Object?> get props => [id, productId, sizeId, size];
}

class SizeDataEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final int status;
  final String? statusEnum;
  final DateTime createdAt;

  const SizeDataEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.status,
    this.statusEnum,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, userId, name, status, statusEnum, createdAt];
}
