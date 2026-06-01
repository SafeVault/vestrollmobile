part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

final class SubmitEmail extends ForgotPasswordEvent {
  const SubmitEmail(this.email);
  final String email;

  @override
  List<Object?> get props => [email];
}

final class EnterPasswordString extends ForgotPasswordEvent {
  const EnterPasswordString(this.passwordString);
  final String passwordString;

  @override
  List<Object?> get props => [passwordString];
}

final class EnterConfirmPasswordString extends ForgotPasswordEvent {
  const EnterConfirmPasswordString(this.passwordString);
  final String passwordString;

  @override
  List<Object?> get props => [passwordString];
}

final class TogglePasswordVisibility extends ForgotPasswordEvent {
  const TogglePasswordVisibility();
}

final class ToggleConfirmPasswordVisibility extends ForgotPasswordEvent {
  const ToggleConfirmPasswordVisibility();
}

final class ResendOtpEvent extends ForgotPasswordEvent {
  const ResendOtpEvent();
}

final class VerifyOtpEvent extends ForgotPasswordEvent {
  const VerifyOtpEvent(this.otpCode);
  final String otpCode;

  @override
  List<Object?> get props => [otpCode];
}
