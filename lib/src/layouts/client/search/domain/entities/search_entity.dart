import 'package:equatable/equatable.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';

class SearchResultEntity extends Equatable {
  final List<StoreEntity> restaurants;
  final List<StoreEntity> supermarkets;

  const SearchResultEntity({
    required this.restaurants,
    required this.supermarkets,
  });

  @override
  List<Object?> get props => [restaurants, supermarkets];
}

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String priceLabel; // e.g. "السعر حسب الاختيار"

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.priceLabel,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, priceLabel];
}

class StoreEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int ratingCount;
  final ProviderStatusEnum status;
  final bool isFavorite;
  final String? discount;
  final double? price;
  final String? unit; // e.g. "500 gm"
  final String providerType; // e.g. "مطعم", "سوبرماركت"
  final List<ProductEntity> products;

  const StoreEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
    required this.providerType,
    required this.status,
    this.isFavorite = false,
    this.discount,
    this.price,
    this.unit,
    this.products = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        rating,
        ratingCount,
        status,
        isFavorite,
        discount,
        price,
        unit,
        providerType,
        products,
      ];
}
