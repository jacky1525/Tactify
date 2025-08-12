import 'package:dio/dio.dart';
import 'package:tactify/core/config/remote_config_manager.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  static Dio get instance => _dio;

  /// Riot token isteyen endpointler
  static Future<Response> getWithRiotKey(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'X-Riot-Token': RemoteConfigManager.riotApiKey,
        },
      ),
    );
  }
}