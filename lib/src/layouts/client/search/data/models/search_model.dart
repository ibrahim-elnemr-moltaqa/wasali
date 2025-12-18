
import '../../domain/entities/search_entity.dart';

class SearchModel extends SearchResultEntity {
  const SearchModel({
    required super.restaurants,
    required super.supermarkets,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      restaurants: (json['restaurants'] as List)
          .map((e) => StoreModel.fromJson(e))
          .toList(),
      supermarkets: (json['supermarkets'] as List)
          .map((e) => StoreModel.fromJson(e))
          .toList(),
    );
  }
}

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.priceLabel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      priceLabel: json['priceLabel'],
    );
  }
}

class StoreModel extends StoreEntity {
  const StoreModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.rating,
    required super.ratingCount,
    required super.providerType,
    required super.status,
    super.isFavorite,
    super.discount,
    super.price,
    super.unit,
    super.products,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      ratingCount: json['ratingCount'],
      providerType: json['providerType'] ?? '',
      status: json['status'],
      isFavorite: json['isFavorite'] ?? false,
      discount: json['discount'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      unit: json['unit'],
      products: json['products'] != null
          ? (json['products'] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList()
          : [],
    );
  }
}
