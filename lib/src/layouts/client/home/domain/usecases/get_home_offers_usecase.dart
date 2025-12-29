import 'package:injectable/injectable.dart';
import 'package:wasli/src/layouts/client/home/data/models/offer_model.dart';

import '../../../../../../core/core.dart';
import '../repositories/home_repository.dart';

@injectable
class GetHomeOffersUseCase implements IUseCase<List<OfferModel>, NoParams> {
  final HomeRepository _repository;

  GetHomeOffersUseCase(this._repository);

  @override
  DomainServiceType<List<OfferModel>> call(NoParams countryId) {
    return _repository.getHomeOffers();
  }
}
