import 'package:equatable/equatable.dart';
import 'package:wasli/src/layouts/client/home/data/models/banner_model.dart';
import 'package:wasli/src/layouts/client/home/data/models/offer_model.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../../../../../../core/core.dart';

class HomeState extends Equatable {
  final Async<List<BannerModel>> bannersState;
  final Async<List<OfferModel>> offersState;
  final Async<List<CategoryEntity>> categoriesState;

  const HomeState({
    required this.bannersState,
    required this.offersState,
    required this.categoriesState,
  });

  const HomeState.initial()
      : this(
          bannersState: const Async.initial(),
          offersState: const Async.initial(),
          categoriesState: const Async.initial(),
        );

  HomeState copyWith({
    Async<List<BannerModel>>? bannersState,
    Async<List<OfferModel>>? offersState,
    Async<List<CategoryEntity>>? categoriesState,
  }) {
    return HomeState(
      bannersState: bannersState ?? this.bannersState,
      offersState: offersState ?? this.offersState,
      categoriesState: categoriesState ?? this.categoriesState,
    );
  }

  @override
  List<Object?> get props => [bannersState, offersState, categoriesState];
}
