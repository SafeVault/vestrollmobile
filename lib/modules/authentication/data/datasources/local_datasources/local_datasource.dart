import 'package:shared_preferences/shared_preferences.dart';
import 'package:vestrollmobile/modules/authentication/data/models/auth_model.dart';

class AuthLocalDataSource {
  AuthLocalDataSource({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'auth_user_id';
  static const String _userEmailKey = 'auth_user_email';
  static const String _userNameKey = 'auth_user_name';

  Future<void> saveSession(AuthModel auth) async {
    await _prefs.setString(_tokenKey, auth.token ?? '');
    await _prefs.setString(_userIdKey, auth.userId);
    await _prefs.setString(_userEmailKey, auth.email);
    if (auth.name != null) {
      await _prefs.setString(_userNameKey, auth.name!);
    }
  }

  Future<AuthModel?> getSession() async {
    final token = _prefs.getString(_tokenKey);
    if (token == null || token.isEmpty) return null;
    return AuthModel(
      userId: _prefs.getString(_userIdKey) ?? '',
      email: _prefs.getString(_userEmailKey) ?? '',
      name: _prefs.getString(_userNameKey),
      token: token,
    );
  }

  Future<String?> getToken() async => _prefs.getString(_tokenKey);

  Future<void> clearSession() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_userIdKey);
    await _prefs.remove(_userEmailKey);
    await _prefs.remove(_userNameKey);
  }
}
