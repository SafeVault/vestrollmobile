import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final VoidCallback? onFinanceTap;

  const BottomNavigationBarWidget({super.key, this.onFinanceTap});

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
            offset: Offset(0, -4),
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
                        isActive: true,
                        onTap: () {
                          context.pushNamed(RouteConstants.homeScreen);
                        },
                      ),
                    ),
                    Expanded(
                      child: _NavItem(
                        icon: Icons.layers_rounded,
                        label: 'Workspace',
                        isActive: false,
                        onTap: () {
                          context.pushNamed(RouteConstants.workspaceScreen);
                        },
                      ),
                    ),
                    SizedBox(width: 64.w), // Space for center button
                    Expanded(
                      child: _NavItem(
                        icon: Icons.monetization_on_rounded,
                        label: 'Finance',
                        isActive: false,
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
                        isActive: false,
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
                      context.pushNamed(RouteConstants.moreScreen);
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
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_upward_rounded,
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
