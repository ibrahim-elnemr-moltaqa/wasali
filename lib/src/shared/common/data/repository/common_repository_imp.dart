import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/api_size_model.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../../domain/entity/educational_stage_entity.dart';
import '../../domain/entity/educational_subject_entity.dart';
import '../../domain/entity/educational_year_entity.dart';
import '../../domain/entity/language_entity.dart';
import '../../domain/entity/specialization_entity.dart';
import '../../domain/repository/common_repository.dart';
import '../../domain/use_cases/send_rate_use_case.dart';

@Injectable(as: CommonRepository)
class CommonRepositoryImp implements CommonRepository {
  final DioHelper _dioHelper;

  const CommonRepositoryImp(this._dioHelper);

  @override
  DomainServiceType<List<CommonEntity>> getCountries() async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(url: 'countries');
        final List date = response['data']['data'] ?? [];
        final List<CommonEntity> countries =
            date.map((e) => CommonEntity.fromJson(e)).toList();
        return Right(countries);
      },
    );
  }

  @override
  DomainServiceType<List<EducationalStageEntity>> getEducationalStages() async {
    return await failureCollect(
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
    return await failureCollect(
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
    return await failureCollect(
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
    return await failureCollect(
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
    return await failureCollect(
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
    return await failureCollect(
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
  DomainServiceType<List<CommonEntity>> getCities({int? areaId}) async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(
            url: 'cities',
            queryParameters: {if (areaId != null) 'area_id': areaId});
        final List date = response['data']['data'] ?? [];
        final List<CommonEntity> cities =
            date.map((e) => CommonEntity.fromJson(e)).toList();
        return Right(cities);
      },
    );
  }

  @override
  DomainServiceType<List<CommonEntity>> getAreas({int? countryId}) async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(
            url: 'areas',
            queryParameters: {if (countryId != null) 'country_id': countryId});
        final List date = response['data']['data'] ?? [];
        final List<CommonEntity> areas =
            date.map((e) => CommonEntity.fromJson(e)).toList();
        return Right(areas);
      },
    );
  }

  @override
  DomainServiceType<List<CategoryEntity>> getMainCategories() async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(url: 'categories');
        final List date = response['data']['data'] ?? [];
        final List<CategoryEntity> categories =
            date.map((e) => CategoryEntity.fromJson(e)).toList();
        return Right(categories);
      },
    );
  }

  @override
  DomainServiceType<List<CategoryEntity>> getSubCategories(
      {int? categoryId, String? endPoint}) async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(
            url: endPoint ?? 'sub-categories',
            queryParameters: {
              if (categoryId != null) 'category_id': categoryId
            });
        final List date = response['data']['data'] ??
            response['data']['sub_categories'] ??
            [];
        final List<CategoryEntity> categories =
            date.map((e) => CategoryEntity.fromJson(e)).toList();
        return Right(categories);
      },
    );
  }

  @override
  DomainServiceType<List<CommonEntity>> getBanks() async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(url: 'banks');
        final List date = response['data']['data'] ?? [];
        final List<CommonEntity> banks =
            date.map((e) => CommonEntity.fromJson(e)).toList();
        return Right(banks);
      },
    );
  }

  @override
  DomainServiceType<List<CommonEntity>> getVehicles() async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(url: 'vehicles');
        final List date = response['data']['data'] ?? [];
        final List<CommonEntity> vehicles =
            date.map((e) => CommonEntity.fromJson(e)).toList();
        return Right(vehicles);
      },
    );
  }

  @override
  DomainServiceType<List<SizeEntity>> getSizes() async {
    return await failureCollect(
      () async {
        final response = await _dioHelper.get(url: 'sizes');
        final List date = response['data']['data'] ?? [];
        final List<SizeEntity> sizes =
            date.map((e) => ApiSizeModel.fromJson(e)).toList();
        return Right(sizes);
      },
    );
  }
}
