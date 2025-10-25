import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/modules/authentication/domain/domain_repositories/auth_domain_repositories.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckStatusRequested>(_onCheckStatusRequested);
    on<AuthTokenRefreshRequested>(_onTokenRefreshRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final result = await _authRepository.login(event.email, event.password);

      emit(
        AuthAuthenticated(
          userId: result['userId'] ?? '',
          email: result['email'] ?? event.email,
          name: result['name'],
          token: result['token'],
        ),
      );
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final result = await _authRepository.register(
        event.email,
        event.password,
        event.name,
      );

      emit(
        AuthAuthenticated(
          userId: result['userId'] ?? '',
          email: result['email'] ?? event.email,
          name: result['name'] ?? event.name,
          token: result['token'],
        ),
      );
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      await _authRepository.logout();
      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
      // Even if logout fails, we still want to clear the local state
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onCheckStatusRequested(
    AuthCheckStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final isLoggedIn = await _authRepository.isLoggedIn();

      if (isLoggedIn) {
        final user = await _authRepository.getCurrentUser();
        final token = await _authRepository.getStoredToken();

        if (user != null) {
          emit(
            AuthAuthenticated(
              userId: user['userId'] ?? '',
              email: user['email'] ?? '',
              name: user['name'],
              token: token,
            ),
          );
        } else {
          emit(const AuthUnauthenticated());
        }
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onTokenRefreshRequested(
    AuthTokenRefreshRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final newToken = await _authRepository.refreshToken();

      if (state is AuthAuthenticated && newToken != null) {
        final currentState = state as AuthAuthenticated;
        emit(
          AuthAuthenticated(
            userId: currentState.userId,
            email: currentState.email,
            name: currentState.name,
            token: newToken,
          ),
        );
      }
    } catch (e) {
      // If token refresh fails, logout the user
      add(AuthLogoutRequested());
    }
  }
}
