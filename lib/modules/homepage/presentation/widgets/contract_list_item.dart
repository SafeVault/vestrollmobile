 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

enum ContractStatus {
  active,
  pending,
  expired,
}

class ContractListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final ContractStatus status;
  final String initials;
  final Color avatarColor;
  final VoidCallback? onTap;

  const ContractListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.status,
    required this.initials,
    required this.avatarColor,
    this.onTap,
  });

  Color _getStatusColor() {
    switch (status) {
      case ContractStatus.active:
        return const Color(0xFF10B981); // Active green
      case ContractStatus.pending:
        return const Color(0xFFF59E0B); // Pending orange
      case ContractStatus.expired:
        return const Color(0xFFEF4444); // Expired red
    }
  }

  String _getStatusText() {
    switch (status) {
      case ContractStatus.active:
        return 'Active';
      case ContractStatus.pending:
        return 'Pending';
      case ContractStatus.expired:
        return 'Expired';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: avatarColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  initials,
                  style: fonts.textMdBold.copyWith(
                    color: avatarColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: fonts.textMdSemiBold.copyWith(
                      color: colors.textPrimary,
                      fontSize: 16.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: fonts.textSmRegular.copyWith(
                      color: colors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: fonts.textMdBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    _getStatusText(),
                    style: fonts.textSmMedium.copyWith(
                      color: _getStatusColor(),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}