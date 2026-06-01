part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({this.emailAddress, this.newPasswordState});

  final String? emailAddress;
  final NewPasswordState? newPasswordState;

  @override
  List<Object?> get props => [emailAddress, newPasswordState];
}

final class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial({super.emailAddress, super.newPasswordState});
}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  const ForgotPasswordSuccess(this.message, {super.emailAddress, super.newPasswordState});

  final String message;

  @override
  List<Object?> get props => [...super.props, message];
}

final class ForgotPasswordError extends ForgotPasswordState {
  const ForgotPasswordError(this.error, {super.emailAddress, super.newPasswordState});

  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}

class NewPasswordState {
  const NewPasswordState({
    required this.password,
    this.confirmPassword = '',
    this.hidePassword = true,
    this.hideConfirmPassword = true,
  });

  final String password;
  final String confirmPassword;
  final bool hidePassword;
  final bool hideConfirmPassword;

  bool get has8Characters => password.length >= 8;
  bool get hasNumber => RegExp(r'[0-9]+').hasMatch(password);
  bool get hasUppercaseCharacter => RegExp(r'[A-Z]+').hasMatch(password);
  bool get hasLowercaseCharacter => RegExp(r'[a-z]+').hasMatch(password);
  bool get hasSpecialCharacter =>
      RegExp(r"[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:',<>\./\?]+").hasMatch(password);
  bool get passwordConfirmed => password == confirmPassword;
  bool get isVerificationPassed =>
      has8Characters &&
      hasNumber &&
      hasUppercaseCharacter &&
      hasLowercaseCharacter &&
      hasSpecialCharacter &&
      passwordConfirmed;

  NewPasswordState copyWith({
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
  }) => NewPasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      hidePassword: showPassword ?? hidePassword,
      hideConfirmPassword: showConfirmPassword ?? hideConfirmPassword,
    );
}
