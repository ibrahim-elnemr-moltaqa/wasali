import 'package:dio/dio.dart';

class ProductBody {
  final int? id;
  final String name;
  final String description;
  final int subCategoryId;
  final double price;
  final dynamic image; 
  final dynamic additionalImage; 
  final List<int>? sizeIds;

  ProductBody({
    this.id,
    required this.name,
    required this.description,
    required this.subCategoryId,
    required this.price,
    this.image,
    this.additionalImage,
    this.sizeIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
      'sub_categorie_id': subCategoryId,
      'price': price,
    };

    if (image != null && image is String == false) {
      data['image'] = MultipartFile.fromFileSync(image.path);
    }
    if (additionalImage != null && additionalImage is String == false) {
      data['additional_image'] =
          MultipartFile.fromFileSync(additionalImage.path);
    }

    if (sizeIds != null) {
      for (int i = 0; i < sizeIds!.length; i++) {
        data['sizes[$i]'] = sizeIds![i];
      }
    }

    if (id != null) {
      data['_method'] = 'PUT';
    }

    return data;
  }
}
