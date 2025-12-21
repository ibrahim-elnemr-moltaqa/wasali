import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double? discountPrice;

  const OfferEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.discountPrice,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl, price, discountPrice];
}
