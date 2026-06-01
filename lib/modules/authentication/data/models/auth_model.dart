import 'package:vestrollmobile/modules/authentication/domain/entities/user.dart';

class AuthModel {
  const AuthModel({
    required this.userId,
    required this.email,
    this.name,
    this.token,
  });

  final String userId;
  final String email;
  final String? name;
  final String? token;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      userId: json['userId'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String?,
      token: json['token'] as String?,
    );

  Map<String, dynamic> toJson() => {
      'userId': userId,
      'email': email,
      'name': name,
      'token': token,
    };

  User toEntity() => User(
      userId: userId,
      email: email,
      name: name,
      token: token,
    );

  factory AuthModel.fromEntity(User user) => AuthModel(
      userId: user.userId,
      email: user.email,
      name: user.name,
      token: user.token,
    );
}
