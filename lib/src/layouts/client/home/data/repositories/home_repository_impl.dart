import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/src/layouts/client/home/data/models/banner_model.dart';
import 'package:wasli/src/layouts/client/home/data/models/offer_model.dart';

import '../../../../../../core/core.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  DomainServiceType<List<BannerModel>> getHomeBanners() async {
    return await failureCollect(
      () async {
        final result = await remoteDataSource.getHomeBanners();
        return Right(result);
    });
  }

  @override
  DomainServiceType<List<OfferModel>> getHomeOffers() async {
    return await failureCollect(
      () async {
        final result = await remoteDataSource.getHomeOffers();
        return Right(result);
    });
  }
}
