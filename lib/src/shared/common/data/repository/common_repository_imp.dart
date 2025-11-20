import 'package:wasli/src/shared/common/domain/entity/city_entity.dart';

import 'package:wasli/core/core.dart';
import '../../domain/use_cases/send_rate_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/country_entity.dart';
import '../../domain/entity/educational_stage_entity.dart';
import '../../domain/entity/educational_subject_entity.dart';
import '../../domain/entity/educational_year_entity.dart';
import '../../domain/entity/language_entity.dart';
import '../../domain/entity/specialization_entity.dart';
import '../../domain/repository/common_repository.dart';

@Injectable(as: CommonRepository)
class CommonRepositoryImp implements CommonRepository {
  final DioHelper _dioHelper;

  const CommonRepositoryImp(this._dioHelper);

  @override
  DomainServiceType<List<CountryEntity>> getCountries() async {
    return await failerCollect(
      () async {
        final response = await _dioHelper.get(url: 'static-pages/countries');
        final List date = response['data'] ?? [];
        final List<CountryEntity> countries =
            date.map((e) => CountryEntity.fromJson(e)).toList();
        return Right(countries);
      },
    );
  }

  @override
  DomainServiceType<List<EducationalStageEntity>> getEducationalStages() async {
    return await failerCollect(
      () async {
        final response =
            await _dioHelper.get(url: 'static-pages/academic-stages');
        final List date = response['data'] ?? [];
        final List<EducationalStageEntity> educationalStages =
            date.map((e) => EducationalStageEntity.fromJson(e)).toList();
        return Right(educationalStages);
      },
    );
  }

  @override
  DomainServiceType<List<EducationalSubjectEntity>>
      getEducationalSubject() async {
    return await failerCollect(
      () async {
        final response =
            await _dioHelper.get(url: 'static-pages/academic-stages');
        final List date = response['data'] ?? [];
        final List<EducationalSubjectEntity> educationalSubjects =
            date.map((e) => EducationalSubjectEntity.fromJson(e)).toList();
        return Right(educationalSubjects);
      },
    );
  }

  @override
  DomainServiceType<List<EducationalYearEntity>> getEducationalYears(
      int stageId) async {
    return await failerCollect(
      () async {
        final response =
            await _dioHelper.get(url: 'static-pages/academic-years/$stageId');
        final List date = response['data'] ?? [];
        final List<EducationalYearEntity> educationalYears =
            date.map((e) => EducationalYearEntity.fromJson(e)).toList();
        return Right(educationalYears);
      },
    );
  }

  @override
  DomainServiceType<List<LanguageEntity>> getLanguages() async {
    return await failerCollect(
      () async {
        final response = await _dioHelper.get(url: 'static-pages/languages');
        final List date = response['data'] ?? [];
        final List<LanguageEntity> languages =
            date.map((e) => LanguageEntity.fromJson(e)).toList();
        return Right(languages);
      },
    );
  }

  @override
  DomainServiceType<List<SpecializationEntity>> getSpecializations() async {
    return await failerCollect(
      () async {
        final response =
            await _dioHelper.get(url: 'static-pages/specializations');
        final List date = response['data'] ?? [];
        final List<SpecializationEntity> specializations =
            date.map((e) => SpecializationEntity.fromJson(e)).toList();
        return Right(specializations);
      },
    );
  }

  @override
  DomainServiceType<Unit> sendRate(RateParams params) async {
    return await failerCollect(
      () async {
        await _dioHelper.post(
          url: params.type == RateParamsEnum.user
              ? 'home-page/providers/${params.id}/add-comment'
              : "app-review",
          body: params.toJson(),
        );
        return const Right(unit);
      },
    );
  }



  @override
  DomainServiceType<List<CityEntity>> getCities() async {
    return await failerCollect(
      () async {
        final response = await _dioHelper.get(url: 'cities');
        final List date = response['data']['data'] ?? [];
        final List<CityEntity> cities =
            date.map((e) => CityEntity.fromJson(e)).toList();
        return Right(cities);
      },
    );
  }
}
