import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vestrollmobile/core/errors/failure.dart';
import 'package:vestrollmobile/core/network/dio_client.dart';
import 'package:vestrollmobile/modules/authentication/data/models/auth_model.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<ApiResult<AuthModel>> login(String email, String password) => _dio.safeCall<AuthModel>(
      () => _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      }),
      (json) => AuthModel.fromJson(json as Map<String, dynamic>),
    );

  Future<ApiResult<AuthModel>> register(
    String email,
    String password,
    String name,
  ) => _dio.safeCall<AuthModel>(
      () => _dio.post('/auth/register', data: {
        'email': email,
        'password': password,
        'name': name,
      }),
      (json) => AuthModel.fromJson(json as Map<String, dynamic>),
    );

  Future<ApiResult<void>> logout() async {
    try {
      await _dio.post('/auth/logout');
      return const Right(null);
    } on DioException {
      // Logout failures are non-fatal — user can still proceed
      return const Right(null);
    }
  }

  Future<ApiResult<AuthModel>> refreshToken() => _dio.safeCall<AuthModel>(
      () => _dio.post('/auth/refresh'),
      (json) => AuthModel.fromJson(json as Map<String, dynamic>),
    );
}
