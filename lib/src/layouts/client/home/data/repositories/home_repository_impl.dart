import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../../domain/entities/home_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  DomainServiceType<HomeData> getHomeData() async {
    final result = await remoteDataSource.getHomeData();
    return Right(result);
  }
}
