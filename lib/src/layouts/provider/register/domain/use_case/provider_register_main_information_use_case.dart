import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/register/domain/repository/provider_register_repository.dart';

@Injectable()
class ProviderRegisterMainInformationUseCase
    extends IUseCase<Unit, MainInformationsParams> {
  final ProviderRegisterRepository _providerRegisterRepository;
  ProviderRegisterMainInformationUseCase(this._providerRegisterRepository);
  @override
  Future<Either<Failure, Unit>> call(MainInformationsParams params) async {
    return await _providerRegisterRepository
        .providerRegisterMainInformations(params);
  }
}

class MainInformationsParams extends Equatable {
  final String name;
  final String mobile;
  final String whatsApp;

  const MainInformationsParams(
      {required this.name, required this.mobile, required this.whatsApp});

  Map<String, dynamic> toJson() => {
        'name': name,
        'mobile': '0$mobile',
        'whatsapp': '0$whatsApp',
        'terms': 1
      };

  @override
  List<Object?> get props => [name, mobile, whatsApp];
}
