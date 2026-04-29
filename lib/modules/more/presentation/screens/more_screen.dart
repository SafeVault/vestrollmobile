import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: Colors.black54,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.bgB0,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: colors.strokeSecondary,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Quick Actions',
                        style: fonts.heading3Bold.copyWith(
                          fontSize: 18.sp,
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildActionTile(
                            context,
                            colors,
                            fonts,
                            icon: Icons.receipt_long_outlined,
                            label: 'Invoice',
                            color: Color(0xFF8B5CF6),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          _buildActionTile(
                            context,
                            colors,
                            fonts,
                            icon: Icons.handshake_outlined,
                            label: 'Contract',
                            color: Color(0xFF3B82F6),
                            onTap: () {
                              Navigator.pop(context);
                              context.pushNamed(RouteConstants.workspaceScreen);
                            },
                          ),
                          _buildActionTile(
                            context,
                            colors,
                            fonts,
                            icon: Icons.flash_on_rounded,
                            label: 'Quick Pay',
                            color: Color(0xFFF97316),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          _buildActionTile(
                            context,
                            colors,
                            fonts,
                            icon: Icons.send_rounded,
                            label: 'Transfer',
                            color: Color(0xFF22C55E),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Divider(color: colors.strokePrimary, height: 1.h),
                      SizedBox(height: 20.h),
                      Text(
                        'Finance Tools',
                        style: fonts.heading3Bold.copyWith(
                          fontSize: 18.sp,
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      _buildListItem(
                        colors,
                        fonts,
                        icon: Icons.analytics_outlined,
                        label: 'Revenue Analytics',
                        subtitle: 'View your earnings breakdown',
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(height: 8.h),
                      _buildListItem(
                        colors,
                        fonts,
                        icon: Icons.schedule_outlined,
                        label: 'Payment Schedule',
                        subtitle: 'Manage upcoming payments',
                        onTap: () {
                          Navigator.pop(context);
                          context.pushNamed(RouteConstants.upcomingPayments);
                        },
                      ),
                      SizedBox(height: 8.h),
                      _buildListItem(
                        colors,
                        fonts,
                        icon: Icons.history_rounded,
                        label: 'Transaction History',
                        subtitle: 'View all your transactions',
                        onTap: () {
                          Navigator.pop(context);
                          context.pushNamed(RouteConstants.transactionsScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Icon(icon, color: color, size: 26.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: fonts.textSmMedium.copyWith(
              color: colors.textSecondary,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    required IconData icon,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: colors.bgB1,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colors.strokePrimary),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: colors.brandDefault.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: colors.brandDefault, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: fonts.textSmMedium.copyWith(
                      color: colors.textPrimary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: fonts.textXsMedium.copyWith(
                      color: colors.textTertiary,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: colors.textTertiary, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
