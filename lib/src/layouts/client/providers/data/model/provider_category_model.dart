import 'package:equatable/equatable.dart';

class ProviderCategoryModel extends Equatable {
  final int id;
  final String name;
  const ProviderCategoryModel({required this.id, required this.name});

  static List<ProviderCategoryModel> get categories => [
    const ProviderCategoryModel(id: 0, name: 'اختار علي مزاجك'),
        const ProviderCategoryModel(id: 1, name: 'كريبات'),
        const ProviderCategoryModel(id: 2, name: 'بيتزا'),
        const ProviderCategoryModel(id: 3, name: 'برجر'),
        const ProviderCategoryModel(id: 4, name: 'فطائر'),
        const ProviderCategoryModel(id: 5, name: 'بيتزا'),
      ];

  @override
  List<Object?> get props => [id, name];
}
