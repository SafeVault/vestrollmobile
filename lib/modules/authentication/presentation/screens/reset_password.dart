import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/managers/app_text.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: const VestrollAppBar(isBack: true, title: ''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: fonts.heading2Bold.copyWith(
                    fontSize: 24.sp,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Enter your email address to get a code to reset your password.',
                  style: fonts.textMdRegular.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                VerticalMargin(20),
                AppTextField(
                  borderRadius: 8.sp,
                  hintText: "Email address",
                  controller: _emailController,
                ),
                const Spacer(),
                PrimaryButton(
                  text: AppTexts.sendCode,
                  textColor: colors.constantContrast,
                  onPressed: () {
                    context.pushNamed(RouteConstants.verifyOtpScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
