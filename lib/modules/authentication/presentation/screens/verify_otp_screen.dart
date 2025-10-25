// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/managers/app_text.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vestrollmobile/shared/services/message_service.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late final CountdownNotifier _countdownNotifier;
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  final StreamController<ErrorAnimationType> _errorController =
      StreamController();
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _countdownNotifier = CountdownNotifier();
  }

  @override
  void dispose() {
    _countdownNotifier.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _clearError() {
    if (_hasError) {
      setState(() => _hasError = false);
    }
  }

  void _handleOtpVerification() {
    if (_otpController.text.length != 6) {
      setState(() => _hasError = true);
      MessageService.showError(
        context,
        AppTexts.invalidOTPCode,
        AppTexts.invalidOTPCodeDesc,
      );
      return;
    }

    context.pushNamed(RouteConstants.newPassword);
  }

  void _handleResendOtp() {
    MessageService.showSuccess(
      context,
      AppTexts.otpCodeResent,
      AppTexts.otpCodeResentDesc,
    );

    context.read<ForgotPasswordBloc>().add(ResendOtpEvent());
    _countdownNotifier.start();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: const VestrollAppBar(isBack: true, title: ''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildHeader(colors, fonts),
            SizedBox(height: 24.h),
            _buildOtpInput(colors, fonts),
            SizedBox(height: 20.h),
            _buildResendButton(colors, fonts),
            SizedBox(height: 20.h),
            _buildInfoCard(colors, fonts),
            const Expanded(child: SizedBox()),
            _buildVerifyButton(),
            _buildBottomSpacing(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Verify OTP", style: fonts.heading2Bold.copyWith(fontSize: 24.sp)),
        const SizedBox(height: 4),
        BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen:
              (previous, current) =>
                  previous.emailAddress != current.emailAddress,
          builder: (context, state) {
            return RichText(
              text: TextSpan(
                text: "Please enter the 6 digit OTP code sent to ",
                style: fonts.textMdRegular.copyWith(
                  color: colors.textSecondary,
                  fontSize: 14.sp,
                ),
                children: [
                  TextSpan(
                    text: state.emailAddress ?? 'lewechi@mail.com',
                    style: fonts.textMdSemiBold.copyWith(
                      color: colors.brandDefault,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildOtpInput(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.enterCode,
          style: fonts.textMdMedium.copyWith(fontSize: 14.sp),
        ),
        const SizedBox(height: 8),
        BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordError) {
              setState(() => _hasError = true);
            }
          },
          builder: (context, state) {
            return PinCodeTextField(
              appContext: context,
              backgroundColor: isDark ? colors.bgB0 : colors.bgB1,
              useHapticFeedback: true,
              obscuringCharacter: '●',
              length: 6,
              obscureText: true,
              showCursor: true,
              autoDismissKeyboard: true,
              autovalidateMode: AutovalidateMode.disabled,
              controller: _otpController,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              textStyle: fonts.bodyMedium.copyWith(fontSize: 20.sp),
              cursorColor: colors.brandDefault,
              cursorHeight: 18.sp,
              focusNode: _otpFocusNode,
              errorAnimationController: _errorController,
              onCompleted: (value) {
                if (value.length == 6 && value == "123456") {
                  _handleOtpVerification();
                } else {
                  _errorController.onListen!();
                  MessageService.showError(
                    context,
                    AppTexts.invalidOTPCode,
                    AppTexts.invalidOTPCodeDesc,
                  );
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldWidth: 52,
                fieldHeight: 52,
                borderWidth: 1,
                activeColor: _hasError ? colors.red500 : colors.brandDefault,
                inactiveColor: _hasError ? colors.red500 : colors.gray200,
                selectedColor: _hasError ? colors.red500 : colors.brandDefault,
                activeFillColor: colors.bgB1,
                inactiveFillColor: colors.bgB1,
                selectedFillColor: isDark ? colors.bgB1 : colors.bgB0,
              ),
              enableActiveFill: true,
              onChanged: (value) => _clearError(),
              validator: _hasError ? (value) => '' : null,
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.gray200),
        borderRadius: BorderRadius.circular(12),
        color: isDark ? colors.bgB1 : colors.bgB0,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppAssets.infoSvg,
            height: 20,
            color: colors.gray500,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppTexts.cantFindCode, style: fonts.textMdSemiBold),
                Text(
                  "Try checking your junk/spam folder, or resend the code.",
                  style: fonts.textSmRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton() {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {}
      },
      child: PrimaryButton(
        text: "Verify code",
        onPressed: _handleOtpVerification,
      ),
    );
  }

  Widget _buildResendButton(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return ValueListenableBuilder<int>(
      valueListenable: _countdownNotifier,
      builder: (context, countdown, child) {
        final isEnabled = countdown == 60;
        final countdownText =
            countdown == 60
                ? ''
                : '\t(00:${countdown > 9 ? countdown : '0$countdown'})';

        return TextButton(
          onPressed: isEnabled ? _handleResendOtp : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppAssets.arrowClockwise,
                color: isEnabled ? colors.brandDefault : colors.textSecondary,
              ),
              SizedBox(width: 8.sp),
              Text(
                "${AppTexts.resendCode}$countdownText",
                style: fonts.textMdMedium.copyWith(
                  color: isEnabled ? colors.brandDefault : colors.textSecondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSpacing() {
    return Column(
      children: [
        if (MediaQuery.viewInsetsOf(context).bottom < 10)
          SizedBox(
            height: 8 + MediaQuery.systemGestureInsetsOf(context).bottom,
          ),
      ],
    );
  }
}

class CountdownNotifier extends ValueNotifier<int> {
  CountdownNotifier() : super(60);

  Timer? _timer;

  void start() {
    _timer?.cancel();
    value = 59;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (value > 0) {
        value--;
      } else {
        timer.cancel();
        value = 60;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
