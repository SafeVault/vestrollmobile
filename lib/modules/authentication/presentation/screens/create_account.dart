import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/or_widget.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/terms_and_agrement.dart';
import 'package:vestrollmobile/shared/widgets/app_bar.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/secondary.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool showError = false;

  ValueNotifier<TextInputFormatter?> inputFormatter = ValueNotifier(null);

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                AppBarHeaderWidget(),
                SizedBox(height: 20.h),
                Text(
                  'Create An Account',
                  style: fonts.heading2Bold.copyWith(
                    fontSize: 24.sp,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Enter your details below to create your account.',
                  style: fonts.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: colors.textSecondary,
                  ),
                ),
                SizedBox(height: 24.h),
                AppTextField(
                  borderRadius: 8.sp,
                  hintText: 'Legal first name',
                  controller: _firstNameController,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  borderRadius: 8.sp,
                  hintText: 'Legal last name',
                  controller: _lastNameController,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  borderRadius: 8.sp,
                  hintText: 'Email address',
                  controller: _emailController,
                ),
                SizedBox(height: 20.h),
                PrimaryButton(
                  text: "Create account",
                  onPressed: () {
                    context.pushNamed(RouteConstants.verifyAccount);
                  },
                ),
                SizedBox(height: 20.h),
                ORWidget(),
                SizedBox(height: 20.h),
                SecondaryButton(
                  text: 'Sign up using Google',
                  icon: AppAssets.googleIcon,
                  onPressed: () {
                    // context.pushNamed(RouteConstants.quickPayScreen);
                  },
                ),
                SizedBox(height: 12.h),
                SecondaryButton(
                  text: 'Sign up using Apple',
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
                      'Already have an account? ',
                      style: fonts.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: colors.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(RouteConstants.signUp);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Login',
                        style: fonts.bodyMedium.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: colors.brandDefault,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70.h),
                TermsAgreementText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
