import '../../domain/entities/offer_entity.dart';

class OfferModel extends OfferEntity {
  const OfferModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.price,
    super.discountPrice,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: json['price'].toDouble(),
      discountPrice: json['discount_price']?.toDouble(),
    );
  }

  const OfferModel.example()
      : this(
            id: 1,
            title: 'example',
            description: 'example',
            imageUrl: 'example',
            price: 1);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'discount_price': discountPrice,
    };
  }
}
