class User {
  const User({
    required this.userId,
    required this.email,
    this.name,
    this.token,
  });

  final String userId;
  final String email;
  final String? name;
  final String? token;

  User copyWith({
    String? userId,
    String? email,
    String? name,
    String? token,
  }) => User(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      token: token ?? this.token,
    );
}
