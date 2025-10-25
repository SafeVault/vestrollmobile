abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final String userId;
  final String email;
  final String? name;
  final String? token;

  const AuthAuthenticated({
    required this.userId,
    required this.email,
    this.name,
    this.token,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthAuthenticated &&
        other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.token == token;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ email.hashCode ^ name.hashCode ^ token.hashCode;
  }
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
