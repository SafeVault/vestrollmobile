// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class AccountSetupCard extends StatelessWidget {
  final double progress;
  final VoidCallback? onTap;

  const AccountSetupCard({super.key, this.progress = 0.2, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 104.h,
        decoration: BoxDecoration(
          color: colors.brandDefault,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Complete Account Setup',
                    style: fonts.heading3Bold.copyWith(
                      fontSize: 16.sp,
                      color: colors.constantContrast,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Finish setting up your account to start\nsending invoices and signing contracts.',
                    style: fonts.textSmRegular.copyWith(
                      fontSize: 12.sp,
                      color: colors.constantContrast.withOpacity(0.9),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            SizedBox(
              width: 56.w,
              height: 56.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 56.w,
                    height: 56.h,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 4.w,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colors.constantContrast,
                      ),
                      backgroundColor: colors.constantContrast.withOpacity(0.3),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: fonts.textSmBold.copyWith(
                      fontSize: 13.sp,
                      color: colors.constantContrast,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
