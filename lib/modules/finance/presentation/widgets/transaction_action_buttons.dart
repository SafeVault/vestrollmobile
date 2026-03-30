import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class TransactionActionButtons extends StatelessWidget {
  final VoidCallback? onHelpTap;
  final VoidCallback? onShareTap;

  const TransactionActionButtons({
    super.key,
    this.onHelpTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onHelpTap ?? () {},
            icon: Icon(
              Icons.help_outline_rounded,
              size: 20.sp,
              color: colors.textPrimary,
            ),
            label: Text(
              'Help centre',
              style: fonts.textMdMedium.copyWith(
                color: colors.textPrimary,
                fontSize: 15.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.gray100, // Light grey matching design
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onShareTap ?? () {},
            icon: Icon(
              Icons.share_outlined,
              size: 20.sp,
              color: colors.constantContrast, // White usually
            ),
            label: Text(
              'Share receipt',
              style: fonts.textMdMedium.copyWith(
                color: colors.constantContrast,
                fontSize: 15.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.brandDefault, // Purple matching design
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
