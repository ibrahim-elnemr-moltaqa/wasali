library core;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart' as intel;
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:wasli/core/config/theme/app_theme.dart';
import 'package:wasli/core/config/theme/light_theme.dart';
import 'package:wasli/core/data/data_source/role_cached_data_source.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/shared/auth/data/models/api_user_model.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/notifications/helpers/firebase/firebase_helper.dart';

import 'base/localization/l10n/app_localizations.dart';
import 'base/localization/l10n/app_localizations_en.dart';
import 'config/values/assets.gen.dart';
import 'data/data_source/language_cache_date_source.dart';
import 'data/data_source/secure_storage_data_source.dart';
import 'data/repository/language_cache_repository_imp.dart';
import 'data/repository/secure_storage_repository_imp.dart';

/// Base Files
///
part "base/async.dart";
part "base/i_use_case.dart";
part "base/localization/app_language_type.dart";
part "base/localization/localization_container.dart";
part "base/pagination/my_pagination_controller.dart";
part "base/pagination/paginated_data.dart";
part "base/pagination/paginated_input.dart";
part "base/typedef.dart";

/// Blocs Files
///
part "blocs/app_auth_bloc/app_authentication_bloc.dart";
part "blocs/app_auth_bloc/app_authentication_events.dart";
part "blocs/app_auth_bloc/app_authentication_states.dart";
part "blocs/language_cubit/app_language_cubit.dart";
part "blocs/language_cubit/app_language_state.dart";

/// Config Files
///
part "config/router/animated_routes.dart";
part "config/router/app_router.dart";
part "config/values/assets_getters.dart";
part "config/values/colors.dart";
part "config/values/dimensions.dart";
part "config/values/fonts.dart";
part "config/values/text_styles.dart";

/// Constants Files
///
part "constants/api_constants.dart";
part "constants/app_constants.dart";

/// Data Files
///
part "data/models/cache_user_model.dart";
part "data/models/token_model.dart";
part "domain/entities/attachemnt.dart";

/// Domain Files
///
part "domain/entities/cached_user_entity.dart";
part "domain/entities/token_entity.dart";
part "domain/repository/language_cache_repository.dart";
part "domain/repository/secure_storage_repository.dart";
part "domain/use_cases/language/clear_language_cache_use_case.dart";
part "domain/use_cases/language/get_cached_language_use_case.dart";
part "domain/use_cases/language/get_device_language_use_case.dart";
part "domain/use_cases/language/set_cached_language_use_case.dart";
part "domain/use_cases/secure_storage/delete_all_secure_cache_use_case.dart";
part "domain/use_cases/secure_storage/get_cached_user_use_case.dart";
part "domain/use_cases/secure_storage/get_is_user_authenticated_use_case.dart";
part "domain/use_cases/secure_storage/get_token_use_case.dart";
part "domain/use_cases/secure_storage/set_cached_user_use_case.dart";
part "domain/use_cases/secure_storage/set_token_use_case.dart";
part "domain/use_cases/user_role/delete_user_role_use_case.dart";
part "domain/use_cases/user_role/get_user_role_use_case.dart";
part "domain/use_cases/user_role/set_user_role_use_case.dart";

/// Network Files
///
part "network/dio_helper.dart";
part "network/errors/exceptions.dart";
part "network/errors/execption_collect.dart";
part "network/errors/failer_collect.dart";
part "network/errors/failures.dart";
part "network/errors/status_code.dart";
part "network/header_interceptor.dart";
part "network/un_authenticated_interceptor.dart";
part "utils/extensions/context_ext.dart";

/// Utils Files
///
part "utils/extensions/date_time_ext.dart";
part "utils/extensions/formatters.dart";
part "utils/extensions/list_ext.dart";
part "utils/extensions/set_ext.dart";
part "utils/extensions/string_ext.dart";
part "utils/extensions/time_of_day.dart";
part "utils/picker/io_file_utils.dart";
part "utils/pretty_numbers_utils.dart";
part "utils/share_and_url_launch/share_utils.dart";
part "utils/share_and_url_launch/url_launcher_utils.dart";
part "utils/validations/validator.dart";
