part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  final NewPasswordState? newPasswordState;
  final String? emailAddress;
  @override
  List<Object?> get props => [emailAddress, newPasswordState];
  const ForgotPasswordState({this.emailAddress, this.newPasswordState});
}

class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial({super.emailAddress, super.newPasswordState});
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;

  const ForgotPasswordSuccess(
    this.message, {
    super.emailAddress,
    super.newPasswordState,
  });

  @override
  List<Object?> get props => super.props..add(message);
}

class ForgotPasswordError extends ForgotPasswordState {
  final String error;

  const ForgotPasswordError(
    this.error, {
    super.emailAddress,
    super.newPasswordState,
  });

  @override
  List<Object?> get props => super.props..add(error);
}

class NewPasswordState {
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

  const NewPasswordState({
    required this.password,
    this.confirmPassword = '',
    this.hidePassword = true,
    this.hideConfirmPassword = true,
  });

  NewPasswordState copyWith({
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
  }) {
    return NewPasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      hidePassword: showPassword ?? hidePassword,
      hideConfirmPassword: showConfirmPassword ?? hideConfirmPassword,
    );
  }
}
