
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/city_entity.dart';

import '../entity/country_entity.dart';
import '../entity/educational_stage_entity.dart';
import '../entity/educational_subject_entity.dart';
import '../entity/educational_year_entity.dart';
import '../entity/language_entity.dart';
import '../entity/specialization_entity.dart';
import '../use_cases/send_rate_use_case.dart';
import 'package:dartz/dartz.dart';


abstract class CommonRepository {
  DomainServiceType<List<CityEntity>> getCities();
  DomainServiceType<List<CountryEntity>> getCountries();
  DomainServiceType<List<LanguageEntity>> getLanguages();
  DomainServiceType<List<SpecializationEntity>> getSpecializations();
  DomainServiceType<List<EducationalStageEntity>> getEducationalStages();
  DomainServiceType<List<EducationalYearEntity>> getEducationalYears(
      int stageId);
  DomainServiceType<List<EducationalSubjectEntity>> getEducationalSubject();
  DomainServiceType<Unit> sendRate(RateParams params);
  
}
