part of core;

@Injectable()
class DioHelper {
  DioHelper() {
    _init();
  }

  @PostConstruct(
    preResolve: true,
  )
  Future<DioHelper> create() async {
    return DioHelper();
  }

  final Dio _dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    sendTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    connectTimeout: const Duration(milliseconds: 30000),
  ));

  final Map<String, String> _headers = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    "api-key": ApiConstants.apiKey
  };

  void _init() {
    _dio.options.headers = _headers;
    _dio.interceptors.add(
      HeaderInterceptor(),
    );
    _dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true, maxWidth: 100));

    _dio.interceptors.add(UnAuthenticatedInterceptor.instance);
  }

  DioHelper copyWith(BaseOptions Function(BaseOptions options) getOptions) {
    final DioHelper newDioObj = this;
    newDioObj._dio.options = getOptions(_dio.options);
    return newDioObj;
  }

  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final result = await apiExecptionCollecter(
      task: () async {
        final FormData? formData = body != null ? FormData.fromMap(body) : null;
        final result = await _dio.get(url,
            data: formData, queryParameters: queryParameters);
        return result;
      },
    );
    if (result is List) {
      return {'data': result};
    } else {
      return result;
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? body,
  }) async {
    return apiExecptionCollecter(
      task: () async {
        final FormData? form =
            formData != null ? FormData.fromMap(formData) : null;
        return await _dio.put(
          url,
          data: form ?? body,
        );
      },
    );
  }

  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? json,
  }) async {
    return apiExecptionCollecter(
      task: () async {
        final FormData? formData = body != null ? FormData.fromMap(body) : null;
        return await _dio.post(url, data: json ?? formData);
      },
    );
  }

  Future<Map<String, dynamic>> delete({
    required String url,
  }) async {
    return apiExecptionCollecter(
      task: () async {
        return await _dio.delete(url);
      },
    );
  }
}
