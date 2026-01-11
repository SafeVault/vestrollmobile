import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class WalletTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const WalletTabBar({
    required this.selectedIndex,
    required this.onTabChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onTabChanged(0),
                  child: Column(
                    children: [
                      Text(
                        'Fiat Wallet',
                        style: fonts.textBaseMedium.copyWith(
                          fontSize: 14.sp,
                          color:
                              selectedIndex == 0
                                  ? colors.brandDefault
                                  : colors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 3.h,
                        color:
                            selectedIndex == 0
                                ? colors.brandDefault
                                : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: GestureDetector(
                  onTap: () => onTabChanged(1),
                  child: Column(
                    children: [
                      Text(
                        'Crypto Wallet',
                        style: fonts.textBaseMedium.copyWith(
                          fontSize: 14.sp,
                          color:
                              selectedIndex == 1
                                  ? colors.brandDefault
                                  : colors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 3.h,
                        color:
                            selectedIndex == 1
                                ? colors.brandDefault
                                : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(height: 1.h, color: colors.strokeSecondary),
        ],
      ),
    );
  }
}
