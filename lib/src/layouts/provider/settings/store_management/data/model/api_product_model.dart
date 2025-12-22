import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';

List<ApiProductModel> apiProductModelFromJson(List<dynamic> str) =>
    List<ApiProductModel>.from(str.map((x) => ApiProductModel.fromJson(x)));

class ApiProductModel extends ProductEntity {
  const ApiProductModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.description,
    required super.subCategoryId,
    required super.price,
    super.image,
    super.additionalImage,
    super.status,
    required super.createdAt,
    super.sizes,
  });

  factory ApiProductModel.fromJson(Map<String, dynamic> json) => ApiProductModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        description: json["description"],
        subCategoryId: json["sub_categorie_id"],
        price: json["price"],
        image: json["image"],
        additionalImage: json["additional_image"],
        status: json["status"] ?? (json["is_active"] == true ? 1 : 0),
        createdAt: DateTime.parse(json["created_at"]),
        sizes: json["sizes"] != null
            ? List<ApiProductSizeModel>.from(
                json["sizes"].map((x) => ApiProductSizeModel.fromJson(x)))
            : null,
      );
}

class ApiProductSizeModel extends ProductSizeEntity {
  const ApiProductSizeModel({
    required super.id,
    required super.productId,
    required super.sizeId,
    super.size,
  });

  factory ApiProductSizeModel.fromJson(Map<String, dynamic> json) =>
      ApiProductSizeModel(
        id: json["id"],
        productId: json["product_id"],
        sizeId: json["size_id"],
        size: json["size"] != null ? ApiSizeDataModel.fromJson(json["size"]) : null,
      );
}

class ApiSizeDataModel extends SizeDataEntity {
  const ApiSizeDataModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.status,
    super.statusEnum,
    required super.createdAt,
  });

  factory ApiSizeDataModel.fromJson(Map<String, dynamic> json) =>
      ApiSizeDataModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        status: json["status"],
        statusEnum: json["status_enum"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
