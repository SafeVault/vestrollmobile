import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/managers/app_text.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/password_requirements_viewer.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  // Create controllers at the state level so they persist across rebuilds
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: VestrollAppBar(isBack: true, title: ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    "Create Your Password",
                    style: fonts.heading2Bold.copyWith(
                      fontSize: 24.sp,
                      color: colors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Enter password to keep your account safe and secure.",
                    style: fonts.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: colors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    buildWhen:
                        (previous, current) =>
                            previous.newPasswordState?.hidePassword !=
                            current.newPasswordState?.hidePassword,
                    builder: (context, state) {
                      return AppTextField(
                        borderRadius: 8.sp,
                        controller:
                            _passwordController, // Use persistent controller
                        hintText: AppTexts.newPassword,
                        hideText: state.newPasswordState?.hidePassword ?? false,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        suffixType: SuffixType.customIcon,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            context.read<ForgotPasswordBloc>().add(
                              TogglePasswordVisibility(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              bottom: 8,
                            ),
                            child: SvgPicture.asset(
                              state.newPasswordState?.hidePassword ?? false
                                  ? AppAssets.eyeIcon
                                  : AppAssets.crossEye,
                              height: 15.sp,
                              width: 15.h,
                              colorFilter: ColorFilter.mode(
                                colors.textSecondary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        onChanged:
                            (p0) => context.read<ForgotPasswordBloc>().add(
                              EnterPasswordString(p0),
                            ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      return Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          Text(
                            AppTexts.passwordRequirements,
                            style: fonts.textSmBold.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                          PasswordRequirementViewer(
                            isPassed:
                                state.newPasswordState?.has8Characters ?? false,
                            text: AppTexts.eightCharacters,
                          ),
                          PasswordRequirementViewer(
                            isPassed:
                                state.newPasswordState?.hasNumber ?? false,
                            text: AppTexts.aNumber,
                          ),
                          PasswordRequirementViewer(
                            isPassed:
                                state.newPasswordState?.hasUppercaseCharacter ??
                                false,
                            text: AppTexts.anUpperCase,
                          ),
                          PasswordRequirementViewer(
                            isPassed:
                                state.newPasswordState?.hasLowercaseCharacter ??
                                false,
                            text: AppTexts.anLowerCase,
                          ),
                          PasswordRequirementViewer(
                            isPassed:
                                state.newPasswordState?.hasSpecialCharacter ??
                                false,
                            text: AppTexts.specialCharacter,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    buildWhen:
                        (previous, current) =>
                            previous.newPasswordState?.hideConfirmPassword !=
                            current.newPasswordState?.hideConfirmPassword,
                    builder: (BuildContext context, ForgotPasswordState state) {
                      return AppTextField(
                        borderRadius: 8.sp,
                        controller:
                            _confirmPasswordController, // Use persistent controller
                        hintText: AppTexts.confirmPassword,
                        hideText:
                            state.newPasswordState?.hideConfirmPassword ??
                            false,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        suffixType: SuffixType.customIcon,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            context.read<ForgotPasswordBloc>().add(
                              ToggleConfirmPasswordVisibility(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              bottom: 8,
                            ),
                            child: SvgPicture.asset(
                              state.newPasswordState?.hideConfirmPassword ??
                                      false
                                  ? AppAssets.eyeIcon
                                  : AppAssets.crossEye,
                              height: 15.sp,
                              width: 15.h,
                              colorFilter: ColorFilter.mode(
                                colors.textSecondary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        onChanged:
                            (p0) => context.read<ForgotPasswordBloc>().add(
                              EnterConfirmPasswordString(p0),
                            ),
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                buildWhen:
                    (previous, current) =>
                        previous.newPasswordState?.isVerificationPassed !=
                        current.newPasswordState?.isVerificationPassed,
                builder: (context, state) {
                  return PrimaryButton(
                    text: AppTexts.setPassword,
                    isEnabled:
                        state.newPasswordState?.isVerificationPassed ?? false,
                    onPressed: () {
                      context.pushNamed(RouteConstants.accountType);
                    },
                  );
                },
              ),
              SizedBox(height: 20.sp),
              if (MediaQuery.viewInsetsOf(context).bottom < 10)
                SizedBox(
                  height: 8 + MediaQuery.systemGestureInsetsOf(context).bottom,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
