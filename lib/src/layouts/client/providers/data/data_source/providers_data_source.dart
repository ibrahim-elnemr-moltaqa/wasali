import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_filter_enum.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';
import 'package:wasli/src/layouts/client/providers/domain/use_cases/get_providers_use_case.dart';

abstract class ProvidersDataSource {
  Future<List<ProviderModel>> fetchProviders({GetProvidersParams? params});
}

@Injectable(as: ProvidersDataSource)
class ProvidersDataSourceImpl implements ProvidersDataSource {
  final DioHelper _dioHelper;

  ProvidersDataSourceImpl(this._dioHelper);

  @override
  Future<List<ProviderModel>> fetchProviders(
      {GetProvidersParams? params}) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    final allProviders = [
      const ProviderModel(
        id: 1,
        name: 'مطعم البيت الشامي',
        imageUrl:
            "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
        status: ProviderStatusEnum.opened,
        rating: 4.8,
        reviewCount: 320,
        description:
            'أشهى المأكولات الشامية الأصيلة، مشاوي ومقبلات طازجة يومياً.',
        isFavorite: true,
      ),
      const ProviderModel(
        id: 2,
        name: 'سوبر ماركت السعادة',
        imageUrl:
            "https://images.unsplash.com/photo-1578916171728-46686eac8d58?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
        status: ProviderStatusEnum.opened,
        rating: 4.2,
        reviewCount: 150,
        description: 'كل ما تحتاجه من مواد غذائية ومنزلية تحت سقف واحد.',
        isFavorite: false,
      ),
      const ProviderModel(
        id: 3,
        name: 'صيدلية الشفاء',
        imageUrl:
            "https://images.unsplash.com/photo-1585435557343-3b092031a831?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
        status: ProviderStatusEnum.closed,
        rating: 4.9,
        reviewCount: 500,
        description: 'خدمة دوائية متميزة، متوفرون لخدمتكم 24 ساعة.',
        isFavorite: true,
      ),
      const ProviderModel(
        id: 4,
        name: 'مشويات السلطان',
        imageUrl:
            "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
        status: ProviderStatusEnum.opened,
        rating: 4.5,
        reviewCount: 210,
        description: 'طعم المشويات الحقيقي، وصفات سرية ومذاق لا يقاوم.',
        isFavorite: false,
      ),
      const ProviderModel(
        id: 5,
        name: 'عصائر طازجة',
        imageUrl:
            "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
        status: ProviderStatusEnum.opened,
        rating: 4.0,
        reviewCount: 85,
        description: 'أفضل تشكيلة من العصائر الطبيعية والكوكتيلات المنعشة.',
        isFavorite: false,
      ),
    ];

    var filteredList = List<ProviderModel>.from(allProviders);

    if (params?.query != null && params!.query!.isNotEmpty) {
      filteredList = filteredList
          .where((provider) =>
              provider.name.toLowerCase().contains(params.query!.toLowerCase()))
          .toList();
    }

    if (params?.status != null) {
      filteredList = filteredList
          .where((provider) => provider.status == params!.status)
          .toList();
    }

    if (params?.filter == ProviderFilterEnum.topRated) {
      filteredList.sort((a, b) => b.rating.compareTo(a.rating));
    }
    // 'closestMe' logic would typically require location, keeping list as is or shuffling for mock.

    return filteredList;
  }
}
