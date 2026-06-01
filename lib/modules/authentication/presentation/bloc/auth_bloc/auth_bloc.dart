import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/core/errors/failure.dart';
import 'package:vestrollmobile/modules/authentication/domain/domain_repositories/auth_domain_repositories.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckStatusRequested>(_onCheckStatusRequested);
    on<AuthTokenRefreshRequested>(_onTokenRefreshRequested);
  }

  final AuthRepository _authRepository;

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _authRepository.login(event.email, event.password);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(_mapFailure(failure))),
      (user) => emit(AuthAuthenticated(user: user, token: user.token)),
    );
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _authRepository.register(
      event.email,
      event.password,
      event.name,
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(AuthError(_mapFailure(failure))),
      (user) => emit(AuthAuthenticated(user: user, token: user.token)),
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _authRepository.logout();
    if (isClosed) return;
    result.fold(
      (_) => emit(const AuthUnauthenticated()),
      (_) => emit(const AuthUnauthenticated()),
    );
  }

  Future<void> _onCheckStatusRequested(
    AuthCheckStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final loggedIn = await _authRepository.isLoggedIn();
      if (isClosed) return;
      if (loggedIn) {
        final user = await _authRepository.getCurrentUser();
        if (isClosed) return;
        final token = await _authRepository.getStoredToken();
        if (isClosed) return;
        if (user != null) {
          emit(AuthAuthenticated(user: user, token: token));
        } else {
          emit(const AuthUnauthenticated());
        }
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (_) {
      if (isClosed) return;
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onTokenRefreshRequested(
    AuthTokenRefreshRequested event,
    Emitter<AuthState> emit,
  ) async {
    final newToken = await _authRepository.refreshToken();
    if (isClosed) return;
    if (state case AuthAuthenticated(:final user) when newToken != null) {
      emit(AuthAuthenticated(user: user, token: newToken));
    } else {
      add(const AuthLogoutRequested());
    }
  }

  String _mapFailure(Failure failure) => switch (failure) {
      NetworkFailure() => 'No internet connection. Please try again.',
      AuthFailure(:final message) => message,
      ValidationFailure(:final message) => message,
      TimeoutFailure() => 'Request timed out. Please try again.',
      ServerFailure(:final message) => 'Server error: $message',
      CacheFailure(:final message) => message,
    };
}
