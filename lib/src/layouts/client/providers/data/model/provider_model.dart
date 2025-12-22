import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';

class ProviderModel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final ProviderStatusEnum status;
  final double rating;
  final int reviewCount;
  final String description;
  final bool isFavorite;

  const ProviderModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.isFavorite,
  });

  const ProviderModel.example()
      : id = 1,
        name = 'Example Provider',
        imageUrl = AppConstants.networkImageTest,
        status = ProviderStatusEnum.opened,
        rating = 4.5,
        reviewCount = 100,
        description = 'This is an example provider',
        isFavorite = false;

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        status,
        rating,
        reviewCount,
        description,
        isFavorite,
      ];
}
