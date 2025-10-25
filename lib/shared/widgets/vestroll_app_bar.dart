import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/image_theme.dart';

class VestrollAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? isBack;
  final Widget? leading;
  final bool centerTitle;

  const VestrollAppBar({
    this.title,
    this.actions,
    this.centerTitle = true,
    this.isBack = false,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: isDark ? colors.bgB0 : colors.bgB1,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      title: Text(
        title ?? '',
        style: fonts.heading2SemiBold.copyWith(color: colors.textPrimary),
      ),
      actions:
          actions ??
          [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 32.h,
                width: 111.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(color: colors.strokePrimary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThemeAdaptiveImage.colorAdaptive(
                      asset: AppAssets.questionSvg,
                      width: 14.sp,
                      height: 14.sp,
                      lightColor: colors.constantDefault,
                      darkColor: colors.constantDefault,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Need Help?',
                      style: fonts.textSmMedium.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
      leading:
          isBack!
              ? IconButton(
                icon: SvgPicture.asset(
                  AppAssets.backArrow,
                  colorFilter: ColorFilter.mode(
                    colors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {
                  context.pop();
                },
              )
              : leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
