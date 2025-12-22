import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.imageUrl,
    super.link,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      imageUrl: json['image_url'],
      link: json['link'],
    );
  }

  const BannerModel.example()
      : this(
            id: 1,
            imageUrl:
                'https://img.freepik.com/free-vector/horizontal-banner-template-food-delivery-service_23-2148530368.jpg',
            link: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'link': link,
    };
  }
}
