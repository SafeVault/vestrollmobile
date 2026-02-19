import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/confetti_wrapper.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';

class ProfileCreatedScreen extends StatelessWidget {
  const ProfileCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfettiWrapper(
      autoStart: true,
      duration: const Duration(seconds: 5),
      particleIntensity: 1000,
      shouldLoop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(child: Center(child: _buildContent(context))),
                _buildActionButton(context),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSuccessIcon(context),
        SizedBox(height: 32.h),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildSuccessIcon(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: colors.brandDefault,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          AppAssets.userCircle,
          width: 40.w,
          height: 40.h,
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      children: [
        Text(
          'Your Profile has been created!',
          textAlign: TextAlign.center,
          style: fonts.heading2Bold.copyWith(
            fontSize: 24.sp,
            color: colors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Your profile has been successfully created. Next, set up a 4-digit PIN to keep your account secure.',
          textAlign: TextAlign.center,
          style: fonts.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return PrimaryButton(
      text: 'Create your PIN',
      isEnabled: true,
      onPressed: () {
        context.pushNamed(RouteConstants.createPin);
      },
    );
  }
}
