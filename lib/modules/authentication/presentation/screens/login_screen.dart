import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';
import 'package:vestrollmobile/core/utils/app_icons.dart';
import 'package:vestrollmobile/core/utils/assets.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/or_widget.dart';
import 'package:vestrollmobile/shared/widgets/app_bar.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/secondary.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool showError = false;

  ValueNotifier<TextInputFormatter?> inputFormatter = ValueNotifier(null);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                AppBarHeaderWidget(),
                SizedBox(height: 15.h),
                Text(
                  'Welcome Back!',
                  style: fonts.heading2Bold.copyWith(
                    fontSize: 24.sp,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Enter your details below to login to your account.',
                  style: fonts.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    color: colors.textSecondary,
                  ),
                ),
                SizedBox(height: 24.h),
                AppTextField(
                  borderRadius: 8.sp,
                  hintText: "Email address",
                  controller: _emailController,
                ),
                SizedBox(height: 20.h),
                ValueListenableBuilder<TextInputFormatter?>(
                  valueListenable: inputFormatter,
                  builder: (context, inputFormatter, _) {
                    return AppTextField(
                      borderRadius: 8.sp,
                      controller: _passwordController,
                      hintText: 'Enter password',
                      errorTextOnValidation: 'Password is required',
                      hideText: _obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      inputFormatters: [
                        inputFormatter ??
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      textInputAction: TextInputAction.done,
                      suffixType: SuffixType.customIcon,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8, right: 14),
                          child: SvgPicture.asset(
                            _obscurePassword
                                ? AppIcons.eyeIcon
                                : AppIcons.crossEyeIcon,
                            height: 18.sp,
                            width: 18.h,
                            colorFilter: ColorFilter.mode(
                              colors.textSecondary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // context.pushNamed(RouteConstants.forgotPassword);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Forgot password?',
                      style: fonts.textBaseMedium.copyWith(
                        color: colors.brandDefault,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                PrimaryButton(
                  text: "Log In",
                  onPressed: () {
                    context.pushNamed(RouteConstants.keypad);
                  },
                ),
                SizedBox(height: 20.h),
                ORWidget(),
                SizedBox(height: 20.h),
                SecondaryButton(
                  text: 'Log in using Google',
                  icon: AppAssets.googleIcon,
                  onPressed: () {
                    // context.pushNamed(RouteConstants.keypad);
                  },
                ),
                SizedBox(height: 12.h),
                SecondaryButton(
                  text: 'Log in using Apple',
                  icon: AppAssets.appleIcon,
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: fonts.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        color: colors.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // context.pushNamed(RouteConstants.passwordValidation);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Sign up',
                        style: fonts.bodyMedium.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: colors.brandDefault,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
