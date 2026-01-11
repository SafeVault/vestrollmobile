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

class PinCreatedScreen extends StatelessWidget {
  const PinCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

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
                Expanded(
                  child: Center(child: _buildContent(context, colors, fonts)),
                ),
                _buildActionButton(context),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSuccessIcon(colors),
        SizedBox(height: 32.h),
        _buildTextContent(colors, fonts),
      ],
    );
  }

  Widget _buildSuccessIcon(ColorSystemExtension colors) {
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

  Widget _buildTextContent(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        Text(
          'Your PIN Has Been Created!',
          textAlign: TextAlign.center,
          style: fonts.heading2Bold.copyWith(color: colors.constantDefault),
        ),
        SizedBox(height: 16.h),
        Text(
          'Your PIN has been successfully created. You can now use this PIN to log in to your account.',
          textAlign: TextAlign.center,
          style: fonts.bodyMedium.copyWith(color: colors.gray500),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return PrimaryButton(
      text: 'Continue',
      isEnabled: true,
      onPressed: () {
        context.pushNamed(RouteConstants.homeScreen);
      },
    );
  }
}
