import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/core/utils/managers/app_text.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordInitial()) {
    on<SubmitEmail>(_submitEmailHandler);
    on<EnterPasswordString>(
      _enterPasswordStringHandler,
      transformer: restartable(),
    );
    on<EnterConfirmPasswordString>(
      _enterConfirmPasswordStringHandler,
      transformer: restartable(),
    );
    on<TogglePasswordVisibility>(_togglePasswordVisibilityHandler);
    on<ToggleConfirmPasswordVisibility>(
      _toggleConfirmPasswordVisibilityHandler,
    );
    on<ResendOtpEvent>(_resendOtpHandler);
    on<VerifyOtpEvent>(_verifyOtpHandler);
  }

  void _submitEmailHandler(
    SubmitEmail event,
    Emitter<ForgotPasswordState> emit,
  ) {
    if (!EmailValidator.validate(event.email)) {
      emit(const ForgotPasswordError('Invalid email format'));
      return;
    }
    emit(ForgotPasswordSuccess('A reset link has been sent to ${event.email}'));
  }

  Future<void> _enterPasswordStringHandler(
    EnterPasswordString event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      ForgotPasswordInitial(
        newPasswordState: (state.newPasswordState ??
                NewPasswordState(password: state.newPasswordState?.password ?? ''))
            .copyWith(password: event.passwordString),
      ),
    );
  }

  Future<void> _enterConfirmPasswordStringHandler(
    EnterConfirmPasswordString event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      ForgotPasswordInitial(
        newPasswordState: (state.newPasswordState ??
                NewPasswordState(password: state.newPasswordState?.password ?? ''))
            .copyWith(confirmPassword: event.passwordString),
      ),
    );
  }

  void _togglePasswordVisibilityHandler(
    TogglePasswordVisibility event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(
      ForgotPasswordInitial(
        newPasswordState: (state.newPasswordState ??
                NewPasswordState(password: state.newPasswordState?.password ?? ''))
            .copyWith(
          showPassword: !(state.newPasswordState?.hidePassword ?? false),
        ),
      ),
    );
  }

  void _toggleConfirmPasswordVisibilityHandler(
    ToggleConfirmPasswordVisibility event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(
      ForgotPasswordInitial(
        newPasswordState: (state.newPasswordState ??
                NewPasswordState(password: state.newPasswordState?.password ?? ''))
            .copyWith(
          showConfirmPassword:
              !(state.newPasswordState?.hideConfirmPassword ?? false),
        ),
      ),
    );
  }

  void _resendOtpHandler(
    ResendOtpEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {}

  void _verifyOtpHandler(
    VerifyOtpEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(ForgotPasswordError(AppTexts.invalidOTPCode));
    emit(const ForgotPasswordInitial());
  }
}
