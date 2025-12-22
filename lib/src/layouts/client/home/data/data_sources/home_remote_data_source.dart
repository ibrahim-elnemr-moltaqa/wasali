import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../models/banner_model.dart';
import '../models/offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getHomeBanners();
  Future<List<OfferModel>> getHomeOffers();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioHelper _dioHelper;

  HomeRemoteDataSourceImpl(this._dioHelper);

  @override
  Future<List<BannerModel>> getHomeBanners() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 3));
    return [
      const BannerModel(
        id: 1,
        imageUrl:
            'https://img.freepik.com/free-vector/horizontal-banner-template-food-delivery-service_23-2148530368.jpg',
      ),
      const BannerModel(
        id: 2,
        imageUrl:
            'https://img.freepik.com/free-vector/fast-food-banner-template_23-2148633364.jpg',
      ),
    ];
  }

  @override
  Future<List<OfferModel>> getHomeOffers() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 3));
    return [
      const OfferModel(
        id: 1,
        title: 'وجبة العائلة',
        description: 'وفر 20% على وجبة العائلة الكبيرة',
        imageUrl:
            'https://img.freepik.com/free-photo/hamburger-with-cheese-and-french-fries_23-2148273031.jpg',
        price: 150,
        discountPrice: 120,
      ),
      const OfferModel(
        id: 2,
        title: 'عرض الشتاء',
        description: 'تخفيضات تصل إلى 50% على المشروبات الساخنة',
        imageUrl:
            'https://img.freepik.com/free-photo/hot-chocolate-with-marshmallows_23-2148766723.jpg',
        price: 50,
        discountPrice: 25,
      ),
      const OfferModel(
        id: 3,
        title: 'سوبر ماركت السعادة',
        description: 'اشتري قطعة واحصل على الثانية مجاناً',
        imageUrl:
            'https://img.freepik.com/free-photo/fresh-vegetables-in-shopping-basket_23-2148281313.jpg',
        price: 100,
        discountPrice: 80,
      ),
    ];
  }
}
