import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

abstract class ProvidersDataSource {
  // Future<void> getProviders();
}

@Injectable(as: ProvidersDataSource)
class ProvidersDataSourceImpl implements ProvidersDataSource {
  final DioHelper _dioHelper;

  ProvidersDataSourceImpl(this._dioHelper);
 
  
}