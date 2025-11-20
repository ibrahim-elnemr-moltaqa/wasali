import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../../domain/entity/menu/faq_entity.dart';
import '../../domain/entity/menu/contact_us_entity.dart';
import '../../domain/entity/menu/static_page_type_enum.dart';
import '../../domain/use_cases/menu/send_contact_us_message_use_case.dart';

import '../../domain/repository/menu_common_repository.dart';

@Injectable(
  as: MenuCommonRepository,
)
class MenuCommonRepositoryImp implements MenuCommonRepository {
  final DioHelper _apiHelper;

  MenuCommonRepositoryImp(
    this._apiHelper,
  );

  @override
  DomainServiceType<String> getStaticPageData(StaticPageTypeEnum type) async {
    return await failerCollect<String>(() async {
      final result = await _apiHelper.get(url: 'settings/${type.key}');
      final String data = result['text'] ?? '';
      return Right(data);
    });
  }

  @override
  DomainServiceType<ContactUsEntity> getContactUsData() async {
    return await failerCollect<ContactUsEntity>(() async {
      final result = await _apiHelper.get(url: "settings/social_contact");
      final data = result['data'];
      return Right(ContactUsEntity.fromJson(data));
    });
  }

  @override
  DomainServiceType<void> sendContactUsMessage(SendContactUsMessageParams params) async {
    return await failerCollect<void>(() async {
      await _apiHelper.post(url: "/contact-us/store", body: params.toMap);
      return const Right(null);
    });
  }

  @override
  DomainServiceType<List<FaqEntity>> getFaqList() async {
    return await failerCollect<List<FaqEntity>>(() async {
      final req = await _apiHelper.get(url: "faq");
      final reqData = req['data']["data"] as List;
      final List<FaqEntity> data = reqData.map((e) => FaqEntity.fromJson(e)).toList();
      return Right(data);
    });
  }
}
