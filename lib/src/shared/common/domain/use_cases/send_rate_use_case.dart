import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import '../repository/common_repository.dart';

@injectable
class SendRateUseCase extends IUseCase<Unit, RateParams> {
  final CommonRepository repository;
  SendRateUseCase(this.repository);
  @override
  Future<Either<Failure, Unit>> call(RateParams countryId) async {
    return repository.sendRate(countryId);
  }
}

class RateParams {
  final RateParamsEnum type;
  final int rate;
  final String review;
  final int? id;
  RateParams({
    required this.type,
    required this.rate,
    required this.review,
    this.id,
  });
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'comment': review,
    };
  }
}

enum RateParamsEnum {
  user,
  app;
}
