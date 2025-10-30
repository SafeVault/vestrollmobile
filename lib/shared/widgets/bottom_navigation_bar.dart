import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        border: Border(top: BorderSide(color: colors.gray100)),
      ),
      child: SizedBox(
        height: 80.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _NavItem(
                    icon: Icons.home_outlined,
                    label: 'Home',
                    isActive: true,
                    onTap: () {
                      context.pushNamed(RouteConstants.homeScreen);
                    },
                  ),
                  _NavItem(
                    icon: Icons.layers_outlined,
                    label: 'Workspace',
                    isActive: false,
                    onTap: () {
                      context.pushNamed(RouteConstants.workspaceScreen);
                    },
                  ),
                  SizedBox(width: 56.w), // Space for center button
                  _NavItem(
                    icon: Icons.attach_money_outlined,
                    label: 'Finance',
                    isActive: false,
                    onTap: () {
                      context.pushNamed(RouteConstants.financeScreen);
                    },
                  ),
                  _NavItem(
                    icon: Icons.more_horiz_outlined,
                    label: 'More',
                    isActive: false,
                    onTap: () {
                      context.pushNamed(RouteConstants.moreOptionsScreen);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20.h,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteConstants.moreScreen);
                  },
                  child: Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: colors.brandDefault,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_upward,
                      color: colors.constantContrast,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? colors.brandDefault : colors.textSecondary,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: fonts.textXsRegular.copyWith(
              fontSize: 10.sp,
              color: isActive ? colors.brandDefault : colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
