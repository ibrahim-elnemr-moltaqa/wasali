import 'package:injectable/injectable.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';

import '../../domain/entities/search_entity.dart';
import '../models/search_model.dart';

abstract class SearchDataSource {
  Future<List<String>> getRecentSearches();
  Future<List<String>> getPopularSearches();
  Future<SearchResultEntity> search(String query);
}

@LazySingleton(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource {
  @override
  Future<List<String>> getRecentSearches() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      'بيتزا',
      'فراخ مشوية عالفحم',
      'لحمة',
      'جبنة موتزريلا',
    ];
  }

  @override
  Future<List<String>> getPopularSearches() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      'جبنة موتزريلا',
      'كريب',
      'شاورما',
      'بيتزا',
      'حلويات',
      'مشويات على الممحم',
    ];
  }

  @override
  Future<SearchResultEntity> search(String query) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Using Data Models here, although mocking usually avoids json parsing loops for simplicity
    // But to demonstrate structure, we return Models which are subclasses of Entities.

    return const SearchModel(
      restaurants: [
        StoreModel(
          id: '1',
          name: 'بابا جونز',
          imageUrl: 'https://via.placeholder.com/150',
          rating: 4.5,
          ratingCount: 100,
          providerType: 'مطعم',
          discount: 'احصل على خصم 20% على بعض المنتجات',
          status: ProviderStatusEnum.opened,
          products: [
            ProductModel(
              id: 'p1',
              name: 'بيتزا مارجريتا',
              imageUrl: 'https://via.placeholder.com/150',
              priceLabel: 'السعر حسب الاختيار',
            ),
            ProductModel(
              id: 'p2',
              name: 'برجر',
              imageUrl: 'https://via.placeholder.com/150',
              priceLabel: 'السعر حسب الاختيار',
            ),
            ProductModel(
              id: 'p3',
              name: 'كرانشي',
              imageUrl: 'https://via.placeholder.com/150',
              priceLabel: 'السعر حسب الاختيار',
            ),
          ],
        ),
        StoreModel(
          id: '2',
          name: 'تشيكين كيكرز',
          imageUrl: 'https://via.placeholder.com/150',
          rating: 4.5,
          ratingCount: 100,
          providerType: 'مطعم',
          status: ProviderStatusEnum.closed,
          products: [
            ProductModel(
              id: 'p4',
              name: 'بيتزا مارجريتا',
              imageUrl: 'https://via.placeholder.com/150',
              priceLabel: 'السعر حسب الاختيار',
            ),
          ],
        ),
      ],
      supermarkets: [
        StoreModel(
          id: '3',
          name: 'كارفور',
          imageUrl: 'https://via.placeholder.com/150',
          rating: 4.5,
          ratingCount: 100,
          providerType: 'سوبرماركت',
          discount: 'خصم 17% على بعض المنتجات',
          status: ProviderStatusEnum.opened,
          products: [
            ProductModel(
              id: 'p5',
              name: 'منتج',
              imageUrl: 'https://via.placeholder.com/150',
              priceLabel: 'السعر حسب الاختيار',
            ),
          ],
        ),
        StoreModel(
            id: '4',
            name: 'جمله ماركت',
            imageUrl: 'https://via.placeholder.com/150',
            rating: 4.5,
            ratingCount: 100,
            providerType: 'سوبرماركت',
            price: 500,
            unit: '600 gm',
            status: ProviderStatusEnum.opened,
            products: [
              ProductModel(
                id: 'p6',
                name: 'منتج',
                imageUrl: 'https://via.placeholder.com/150',
                priceLabel: 'السعر حسب الاختيار',
              ),
            ]),
      ],
    );
  }
}
