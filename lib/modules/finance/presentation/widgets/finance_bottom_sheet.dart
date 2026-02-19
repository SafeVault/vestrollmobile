import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/bottom_sheet.dart';

class FinanceBottomSheet extends StatelessWidget {
  const FinanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return VestrollBottomSheet(
      title: 'Finance',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionItem(
            context,
            icon: Icons.add_circle_outline_rounded,
            label: 'Add Money',
            onTap: () {
              // TODO: Navigate to Add Money screen
              Navigator.pop(context);
            },
            colors: colors,
            fonts: fonts,
          ),
          _buildDivider(colors),
          _buildActionItem(
            context,
            icon: Icons.send_rounded,
            label: 'Transfer',
            onTap: () {
              // TODO: Navigate to Transfer screen
              Navigator.pop(context);
            },
            colors: colors,
            fonts: fonts,
          ),
          _buildDivider(colors),
          _buildActionItem(
            context,
            icon: Icons.account_balance_wallet_outlined,
            label: 'Withdraw',
            onTap: () {
              // TODO: Navigate to Withdraw screen
              Navigator.pop(context);
            },
            colors: colors,
            fonts: fonts,
          ),
          _buildDivider(colors),
          _buildActionItem(
            context,
            icon: Icons.history_rounded,
            label: 'Transactions',
            onTap: () {
              // TODO: Navigate to Transactions screen
              Navigator.pop(context);
            },
            colors: colors,
            fonts: fonts,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: colors.brandDefault.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: colors.brandDefault, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Text(
              label,
              style: fonts.textMdMedium.copyWith(
                color: colors.textPrimary,
                fontSize: 16.sp,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: colors.textTertiary,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(ColorSystemExtension colors) {
    return Padding(
      padding: EdgeInsets.only(left: 74.w, right: 24.w),
      child: Divider(
        color: colors.strokeSecondary,
        height: 1.h,
        thickness: 1.h,
      ),
    );
  }
}
