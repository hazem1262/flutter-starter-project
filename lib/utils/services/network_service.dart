import 'package:dio/dio.dart';
import 'package:flutterstarterproject/utils/constants.dart';
import 'package:flutterstarterproject/utils/services/localization_service.dart';
import 'package:flutterstarterproject/utils/services/shared_preferences_service.dart';
import 'package:get/get.dart' hide Response;

class NetworkService extends GetxService {
  NetworkService._(this._dio);
  final Dio _dio;
  static NetworkService init() {
    final Dio dio = Dio(BaseOptions(
      receiveTimeout: requestTimeout,
      connectTimeout: requestTimeout,
      sendTimeout: requestTimeout,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        // Authorization
        final bool isAuthorized = options.extra['isAuthorized'] as bool;
        if (isAuthorized) {
          final String token = Get.find<SharedPreferencesService>().token;
          options.headers['Authorization'] = 'Bearer $token';
        }

        // Language
        final AppLocale locale = Get.find<LocalizationService>().currentLocale;
        if (locale.languageCode != null) {
          options.headers['Accept-Language'] = locale.languageCode;
        }
        return options;
      },
    ));

    if (logAPIRequests) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }

    return NetworkService._(dio);
  }
  /*



  Future<dynamic> perform(NetworkRequest request) async {
    final Response<dynamic> response = await _dio.request<dynamic>(
      request.url,
      data: request.data,
      options: _getOptions(request),
    );
    return response.data;
  }

  Options _getOptions(NetworkRequest request) {
    return Options(
      headers: request.headers,
      method: request.method.name,
      extra: <String, dynamic>{'isAuthorized': request.isAuthorized},
      validateStatus: isValidStatusCode,
    );
  }

  bool isValidStatusCode(int statusCode) {
    if (statusCode == 401) {
      throw UnAuthorizedException();
    } else if (statusCode == 403) {
      throw ForbiddenException();
    } else {
      return true;
    }
  }*/
}
