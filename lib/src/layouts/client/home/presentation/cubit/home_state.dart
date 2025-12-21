import 'package:equatable/equatable.dart';
import '../../../../../../core/core.dart';
import '../../domain/entities/home_data.dart';

class HomeState extends Equatable {
  final Async<HomeData> homeDataState;

  const HomeState({
    required this.homeDataState,
  });

  const HomeState.initial()
      : this(
          homeDataState: const Async.initial(),
        );

  HomeState copyWith({
    Async<HomeData>? homeDataState,
  }) {
    return HomeState(
      homeDataState: homeDataState ?? this.homeDataState,
    );
  }

  @override
  List<Object?> get props => [homeDataState];
}
