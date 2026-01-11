// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class AccountSetupCard extends StatelessWidget {
  const AccountSetupCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.brandDefault,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete Account Setup',
                  style: fonts.heading3Bold.copyWith(
                    fontSize: 16.sp,
                    color: colors.constantContrast,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Finish setting up your account to start\nsending invoices and signing contracts.',
                  style: fonts.textSmRegular.copyWith(
                    fontSize: 12.sp,
                    color: colors.constantContrast,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: CircularProgressIndicator(
                    value: 0.2,
                    strokeWidth: 3.w,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colors.constantContrast,
                    ),
                    backgroundColor: colors.brandDefault.withOpacity(0.3),
                  ),
                ),
                Text(
                  '20%',
                  style: fonts.textSmBold.copyWith(
                    fontSize: 12.sp,
                    color: colors.constantContrast,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
