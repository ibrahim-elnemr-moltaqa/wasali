import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';

@Injectable()
class ProviderMainInformationUseCase
    extends IUseCase<Unit, MainInformationsParams> {
  final ProviderAuthenticationRepository _providerRegisterRepository;
  ProviderMainInformationUseCase(this._providerRegisterRepository);
  @override
  Future<Either<Failure, Unit>> call(MainInformationsParams params) async {
    if (!params.hasAnyField) {
      return const Left(
        Failure(message: 'No fields to update'),
      );
    }
    return await _providerRegisterRepository
        .providerRegisterMainInformations(params);
  }
}

class MainInformationsParams extends Equatable {
  final String? name;
  final String? mobile;
  final String? codeMobile;
  final String? whatsApp;
  final String? codeWhatsapp;
  final bool isUpdate;

  const MainInformationsParams(
      {this.name, this.mobile, this.codeMobile, this.whatsApp, this.codeWhatsapp, this.isUpdate = false});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (name != null) {
      data['name'] = name;
    }

    if (mobile != null) {
      data['mobile'] = mobile;
    }

    if (codeMobile != null) {
      data['code_mobile'] = codeMobile;
    }

    if (whatsApp != null) {
      data['whatsapp'] = whatsApp;
    }

    if (codeWhatsapp != null) {
      data['code_whatsapp'] = codeWhatsapp;
    }

    return data;
  }

  bool get hasAnyField => name != null || mobile != null || whatsApp != null;

  bool get isChangingMobile => mobile != null;

  MainInformationsParams copyWith({
    String? name,
    String? mobile,
    String? mobileCode,
    String? whatsApp,
    String? whatsAppCode, 
  }) {
    return MainInformationsParams(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      codeMobile: mobileCode ?? this.codeMobile,
      whatsApp: whatsApp ?? this.whatsApp,
      codeWhatsapp: whatsAppCode ?? this.codeWhatsapp,
    );
  }

  @override
  List<Object?> get props => [name, mobile, codeMobile, whatsApp, codeWhatsapp, isUpdate];
}
