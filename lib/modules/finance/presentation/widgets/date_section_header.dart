import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class DateSectionHeader extends StatelessWidget {
  final String date;

  const DateSectionHeader({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Center(
        child: Text(
          date,
          style: fonts.textSmRegular.copyWith(
            color: colors.textTertiary,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
