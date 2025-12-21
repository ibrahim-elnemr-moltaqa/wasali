import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/home/domain/entities/home_data.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../models/banner_model.dart';
import '../models/offer_model.dart';

class HomeSimulatedData extends HomeData {
  const HomeSimulatedData({required super.banners, required super.offers, required super.categories});
}

abstract class HomeRemoteDataSource {
  Future<HomeSimulatedData> getHomeData();
  Future<List<CommonEntity>> getHomeCategories();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioHelper _dioHelper;

  HomeRemoteDataSourceImpl(this._dioHelper);
  @override
  Future<HomeSimulatedData> getHomeData() async {
    final categories = await getHomeCategories();
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 1));

    final banners = [
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

    final offers = [
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
    

    return HomeSimulatedData(banners: banners, offers: offers, categories: categories);
  }

  @override
  Future<List<CommonEntity>> getHomeCategories() async {
    try {
      final response = await _dioHelper.get(url: 'categories');
      final List date = response['data']['data'] ?? [];
      final List<CommonEntity> categories =
          date.map((e) => CommonEntity.fromJson(e)).toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
