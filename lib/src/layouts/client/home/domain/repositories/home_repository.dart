import 'package:wasli/src/layouts/client/home/data/models/banner_model.dart';
import 'package:wasli/src/layouts/client/home/data/models/offer_model.dart';

import '../../../../../../core/core.dart';

abstract class HomeRepository {
  DomainServiceType<List<BannerModel>> getHomeBanners();
  DomainServiceType<List<OfferModel>> getHomeOffers();
}
