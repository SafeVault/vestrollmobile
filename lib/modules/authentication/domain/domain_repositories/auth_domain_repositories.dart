import 'package:vestrollmobile/core/errors/failure.dart';
import 'package:vestrollmobile/modules/authentication/domain/entities/user.dart';

abstract class AuthRepository {
  Future<ApiResult<User>> login(String email, String password);
  Future<ApiResult<User>> register(String email, String password, String name);
  Future<ApiResult<void>> logout();
  Future<bool> isLoggedIn();
  Future<String?> getStoredToken();
  Future<User?> getCurrentUser();
  Future<String?> refreshToken();
}
