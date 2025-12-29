import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../entity/educational_stage_entity.dart';
import '../entity/educational_subject_entity.dart';
import '../entity/educational_year_entity.dart';
import '../entity/language_entity.dart';
import '../entity/specialization_entity.dart';
import '../use_cases/send_rate_use_case.dart';

abstract class CommonRepository {
  DomainServiceType<List<CommonEntity>> getCities({int? areaId});
  DomainServiceType<List<CommonEntity>> getAreas({int? countryId});
  DomainServiceType<List<CommonEntity>> getCountries();
  DomainServiceType<List<SizeEntity>> getSizes();
  DomainServiceType<List<CommonEntity>> getBanks();
  DomainServiceType<List<CommonEntity>> getVehicles();
  DomainServiceType<List<CategoryEntity>> getMainCategories();
  DomainServiceType<List<CategoryEntity>> getSubCategories({int? categoryId, String? endPoint});
  DomainServiceType<List<LanguageEntity>> getLanguages();
  DomainServiceType<List<SpecializationEntity>> getSpecializations();
  DomainServiceType<List<EducationalStageEntity>> getEducationalStages();
  DomainServiceType<List<EducationalYearEntity>> getEducationalYears(
      int stageId);
  DomainServiceType<List<EducationalSubjectEntity>> getEducationalSubject();
  DomainServiceType<Unit> sendRate(RateParams params);
}
