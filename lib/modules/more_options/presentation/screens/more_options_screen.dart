import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(title: 'More', isBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildProfileCard(colors, fonts),
            SizedBox(height: 20.h),
            _buildSectionHeader('Account', colors, fonts),
            SizedBox(height: 8.h),
            _buildMenuGroup(
              colors,
              fonts,
              items: [
                _MenuItem(
                  icon: Icons.person_outline_rounded,
                  label: 'Personal Information',
                  onTap: () => context.pushNamed(RouteConstants.personalDetails),
                ),
                _MenuItem(
                  icon: Icons.shield_outlined,
                  label: 'Identity Verification',
                  onTap: () {},
                ),
                _MenuItem(
                  icon: Icons.lock_outline_rounded,
                  label: 'Security & Privacy',
                  onTap: () {},
                ),
                _MenuItem(
                  icon: Icons.notifications_outlined,
                  label: 'Notifications',
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildSectionHeader('Finance', colors, fonts),
            SizedBox(height: 8.h),
            _buildMenuGroup(
              colors,
              fonts,
              items: [
                _MenuItem(
                  icon: Icons.account_balance_outlined,
                  label: 'Linked Bank Accounts',
                  onTap: () {},
                ),
                _MenuItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Tax Documents',
                  onTap: () {},
                ),
                _MenuItem(
                  icon: Icons.currency_exchange_rounded,
                  label: 'Currency Preferences',
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildSectionHeader('Support', colors, fonts),
            SizedBox(height: 8.h),
            _buildMenuGroup(
              colors,
              fonts,
              items: [
                _MenuItem(
                  icon: Icons.help_outline_rounded,
                  label: 'Help Center',
                  onTap: () {},
                ),
                _MenuItem(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Contact Support',
                  onTap: () {},
                ),
                _MenuItem(
                  icon: Icons.star_outline_rounded,
                  label: 'Rate App',
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildLogoutButton(colors, fonts, context),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeTab: BottomNavTab.more,
      ),
    );
  }

  Widget _buildProfileCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF5E2A8C),
                  const Color(0xFF8B5CF6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'AA',
                style: fonts.heading3Bold.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
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
                  'Adebisi Adeyemi',
                  style: fonts.textMdBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'adebisi@vestroll.io',
                  style: fonts.textSmRegular.copyWith(
                    color: colors.textSecondary,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.green500.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Freelancer',
                    style: fonts.textXsMedium.copyWith(
                      color: colors.green500,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: colors.textTertiary,
            size: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: fonts.textSmMedium.copyWith(
          color: colors.textTertiary,
          fontSize: 12.sp,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuGroup(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    required List<_MenuItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;

          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.vertical(
                  top: index == 0
                      ? Radius.circular(16.r)
                      : Radius.zero,
                  bottom: isLast
                      ? Radius.circular(16.r)
                      : Radius.zero,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: colors.brandDefault.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          item.icon,
                          color: colors.brandDefault,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          item.label,
                          style: fonts.textMdMedium.copyWith(
                            color: colors.textPrimary,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: colors.textTertiary,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
              if (!isLast)
                Padding(
                  padding: EdgeInsets.only(left: 64.w),
                  child: Divider(
                    color: colors.strokePrimary,
                    height: 1.h,
                    thickness: 1.h,
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLogoutButton(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        context.go('/');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: colors.red500.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.red500.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, color: colors.red500, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              'Log Out',
              style: fonts.textMdBold.copyWith(
                color: colors.red500,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
