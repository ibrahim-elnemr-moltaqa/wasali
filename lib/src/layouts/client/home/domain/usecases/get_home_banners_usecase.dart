import 'package:injectable/injectable.dart';
import 'package:wasli/src/layouts/client/home/data/models/banner_model.dart';

import '../../../../../../core/core.dart';
import '../repositories/home_repository.dart';

@injectable
class GetHomeBannersUseCase implements IUseCase<List<BannerModel>, NoParams> {
  final HomeRepository _repository;

  GetHomeBannersUseCase(this._repository);

  @override
  DomainServiceType<List<BannerModel>> call(NoParams countryId) {
    return _repository.getHomeBanners();
  }
}
