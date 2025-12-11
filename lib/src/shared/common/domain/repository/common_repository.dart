import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../entity/educational_stage_entity.dart';
import '../entity/educational_subject_entity.dart';
import '../entity/educational_year_entity.dart';
import '../entity/language_entity.dart';
import '../entity/specialization_entity.dart';
import '../use_cases/send_rate_use_case.dart';

abstract class CommonRepository {
  DomainServiceType<List<CommonEntity>> getCities();
  DomainServiceType<List<CommonEntity>> getAreas();
  DomainServiceType<List<CommonEntity>> getCountries();
  DomainServiceType<List<LanguageEntity>> getLanguages();
  DomainServiceType<List<SpecializationEntity>> getSpecializations();
  DomainServiceType<List<EducationalStageEntity>> getEducationalStages();
  DomainServiceType<List<EducationalYearEntity>> getEducationalYears(
      int stageId);
  DomainServiceType<List<EducationalSubjectEntity>> getEducationalSubject();
  DomainServiceType<Unit> sendRate(RateParams params);
}
