import '../../../../../../core/core.dart';
import '../entities/home_data.dart';

abstract class HomeRepository {
  DomainServiceType<HomeData> getHomeData();
}
