import 'package:equatable/equatable.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import '../entities/banner_entity.dart';
import '../entities/offer_entity.dart';

class HomeData extends Equatable {
  final List<BannerEntity> banners;
  final List<OfferEntity> offers;
  final List<CommonEntity> categories;

  const HomeData({
    required this.banners,
    required this.offers,
    this.categories = const [],
  });

  HomeData.initial() : this(banners: [], offers: [], categories: []);

  @override
  List<Object?> get props => [banners, offers, categories];
}
