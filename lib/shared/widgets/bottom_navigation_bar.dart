import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/bottom_nav_tab.dart';

export 'bottom_nav_tab.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final VoidCallback? onFinanceTap;
  final BottomNavTab activeTab;

  const BottomNavigationBarWidget({
    super.key,
    this.onFinanceTap,
    this.activeTab = BottomNavTab.home,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return Container(
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: _NavItem(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        isActive: activeTab == BottomNavTab.home,
                        onTap: () {
                          context.pushNamed(RouteConstants.homeScreen);
                        },
                      ),
                    ),
                    Expanded(
                      child: _NavItem(
                        icon: Icons.layers_rounded,
                        label: 'Workspace',
                        isActive: activeTab == BottomNavTab.workspace,
                        onTap: () {
                          context.pushNamed(RouteConstants.workspaceScreen);
                        },
                      ),
                    ),
                    SizedBox(width: 64.w),
                    Expanded(
                      child: _NavItem(
                        icon: Icons.monetization_on_rounded,
                        label: 'Finance',
                        isActive: activeTab == BottomNavTab.finance,
                        onTap: () {
                          if (onFinanceTap != null) {
                            onFinanceTap!();
                          } else {
                            context.pushNamed(RouteConstants.financeScreen);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: _NavItem(
                        icon: Icons.more_horiz_rounded,
                        label: 'More',
                        isActive: activeTab == BottomNavTab.more,
                        onTap: () {
                          context.pushNamed(RouteConstants.moreOptionsScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -32.h,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const _QuickActionSheet(),
                      );
                    },
                    child: Container(
                      width: 64.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: colors.brandDefault,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: colors.brandDefault.withOpacity(0.3),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: colors.constantContrast,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? colors.brandDefault : colors.textTertiary,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: fonts.textXsMedium.copyWith(
              fontSize: 11.sp,
              color: isActive ? colors.brandDefault : colors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionSheet extends StatelessWidget {
  const _QuickActionSheet();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    final actions = [
      (Icons.receipt_long_outlined, 'Invoice', const Color(0xFF8B5CF6)),
      (Icons.handshake_outlined, 'Contract', const Color(0xFF3B82F6)),
      (Icons.flash_on_rounded, 'Quick Pay', const Color(0xFFF97316)),
      (Icons.send_rounded, 'Transfer', const Color(0xFF22C55E)),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            'Create New',
            style: fonts.heading3Bold.copyWith(
              fontSize: 18.sp,
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: actions.map((action) {
              return GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: action.$3.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: action.$3.withOpacity(0.2)),
                      ),
                      child: Icon(action.$1, color: action.$3, size: 28.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      action.$2,
                      style: fonts.textSmMedium.copyWith(
                        color: colors.textSecondary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
