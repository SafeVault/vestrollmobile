abstract class AuthRepository {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String name,
  );
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String?> getStoredToken();
  Future<Map<String, dynamic>?> getCurrentUser();
  Future<String?> refreshToken();
}
