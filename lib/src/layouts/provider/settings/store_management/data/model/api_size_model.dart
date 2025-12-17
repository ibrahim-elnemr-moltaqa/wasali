import 'package:wasli/src/layouts/provider/settings/store_management/data/enum/size_status_enum.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';

List<ApiSizeModel> apiSizeModelFromJson(List<dynamic> str) =>
    List<ApiSizeModel>.from(str.map((x) => ApiSizeModel.fromJson(x)));

class ApiSizeModel extends SizeEntity {
  const ApiSizeModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.status,
    // required super.statusEnum,
    required super.createdAt,
  });

  factory ApiSizeModel.fromJson(Map<String, dynamic> json) => ApiSizeModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        status: json["status"],
        // statusEnum: SizeStatusEnum.formString(json["status_enum"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        status,
        // statusEnum,
        createdAt,
      ];
}
