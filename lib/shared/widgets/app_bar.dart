// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';
import 'package:vestrollmobile/core/utils/assets.dart';

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
        widget ?? Image.asset(AppAssets.vestrollImage),
        Container(
          height: 32.h,
          width: 111.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: colors.constantDefault),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: 17.sp,
                width: 17.sp,
                AppAssets.questionSvg,
                color: colors.red200,
              ),
              const SizedBox(width: 4),
              Text('Need Help?', style: fonts.textSmMedium),
            ],
          ),
        ),
      ],
    );
  }
}
