import 'package:dartz/dartz.dart';
import 'package:vestrollmobile/core/errors/failure.dart';
import 'package:vestrollmobile/modules/authentication/data/datasources/local_datasources/local_datasource.dart';
import 'package:vestrollmobile/modules/authentication/data/datasources/remote_data_sources/remote_datasource.dart';
import 'package:vestrollmobile/modules/authentication/domain/domain_repositories/auth_domain_repositories.dart';
import 'package:vestrollmobile/modules/authentication/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<ApiResult<User>> login(String email, String password) async {
    try {
      final result = await _remoteDataSource.login(email, password);
      return result.fold(
        Left.new,
        (authModel) {
          _localDataSource.saveSession(authModel);
          return Right(authModel.toEntity());
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<User>> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final result = await _remoteDataSource.register(email, password, name);
      return result.fold(
        Left.new,
        (authModel) {
          _localDataSource.saveSession(authModel);
          return Right(authModel.toEntity());
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (_) {}
    await _localDataSource.clearSession();
    return const Right(null);
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _localDataSource.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String?> getStoredToken() async => _localDataSource.getToken();

  @override
  Future<User?> getCurrentUser() async {
    final session = await _localDataSource.getSession();
    return session?.toEntity();
  }

  @override
  Future<String?> refreshToken() async {
    try {
      final result = await _remoteDataSource.refreshToken();
      return result.fold(
        (_) => null,
        (authModel) {
          _localDataSource.saveSession(authModel);
          return authModel.token;
        },
      );
    } catch (_) {
      return null;
    }
  }
}
