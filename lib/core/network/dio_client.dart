import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vestrollmobile/core/errors/failure.dart';
import 'package:vestrollmobile/core/network/api_constants.dart';

Dio createDio() {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: ApiConstants.connectTimeout,
    receiveTimeout: ApiConstants.receiveTimeout,
    validateStatus: (status) => status != null && status < 500,
    headers: {'Content-Type': 'application/json'},
  ));

  dio.interceptors.addAll([
    AuthInterceptor(),
    LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  String? _getToken() => null; // Injected via shared_preferences at runtime
}

extension DioExtensions on Dio {
  Future<ApiResult<T>> safeCall<T>(
    Future<Response> Function() request,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final response = await request();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(fromJson(response.data));
      }
      return Left(_mapHttpError(response));
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    }
  }

  Failure _mapHttpError(Response response) => switch (response.statusCode) {
      400 => const ServerFailure('Bad request'),
      401 => const AuthFailure('Session expired'),
      403 => const AuthFailure('Access denied'),
      404 => const ServerFailure('Resource not found'),
      422 => ValidationFailure(
        'Validation failed',
        fieldErrors: Map<String, String>.from(response.data?['errors'] ?? {}),
      ),
      429 => const ServerFailure('Too many requests'),
      _ => ServerFailure('Server error (${response.statusCode})'),
    };

  Failure _mapDioException(DioException e) => switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout =>
        const TimeoutFailure(),
      DioExceptionType.connectionError => const NetworkFailure(),
      DioExceptionType.badResponse => ServerFailure(e.message ?? 'Server error'),
      DioExceptionType.cancel => const ServerFailure('Request cancelled'),
      _ => ServerFailure(e.message ?? 'Unexpected error'),
    };
}
