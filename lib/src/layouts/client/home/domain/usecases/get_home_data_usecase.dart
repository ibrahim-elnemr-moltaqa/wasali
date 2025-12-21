import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../entities/home_data.dart';
import '../repositories/home_repository.dart';

@injectable
class GetHomeDataUseCase extends IUseCase<HomeData, NoParams> {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  @override
  DomainServiceType<HomeData> call(NoParams params) {
    return repository.getHomeData();
  }
}
