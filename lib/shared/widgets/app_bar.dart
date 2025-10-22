// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';
import 'package:vestrollmobile/core/utils/image_theme.dart';

class AppBarHeaderWidget extends StatelessWidget {
  const AppBarHeaderWidget({super.key, this.widget});
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget ??
            Container(
              width: 40.sp,
              height: 40.sp,
              decoration: BoxDecoration(
                color: colors.constantDefault,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: const EdgeInsets.all(8),
              // child: ThemeAdaptiveImage.colorAdaptive(
              //   asset: AppAssets.defiFundrLogo,
              //   width: 14.sp,
              //   height: 24.sp,
              //   lightColor: colors.constantContrast,
              //   darkColor: colors.constantContrast,
              // ),
            ),
        Container(
          height: 32.h,
          width: 111.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(
              // color: context.theme.iconTheme.color!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ThemeAdaptiveImage.colorAdaptive(
              //   asset: Assets.icons.questionSvg,
              //   width: 14.sp,
              //   height: 14.sp,
              //   lightColor: colors.constantDefault,
              //   darkColor: colors.constantDefault,
              // ),
              const SizedBox(width: 4),
              Text('Need Help?', style: fonts.textSmMedium),
            ],
          ),
        ),
      ],
    );
  }
}
