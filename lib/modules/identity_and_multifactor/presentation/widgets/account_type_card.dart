import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class AccountTypeCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String? badge;
  final bool isEnabled;
  final bool isSelected;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.badge,
    this.isEnabled = true,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Card(
      elevation: 0,
      color: !isEnabled ? colors.gray300 : colors.bgB0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color:
              isSelected ? colors.brandDefault : colors.gray300.withAlpha(80),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Icon container at top-left
                        SvgPicture.asset(
                          icon,
                          color: colors.brandDefault,
                          height: 24.sp,
                        ),

                        // Badge at top-right
                        if (badge != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: colors.green500,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badge!,
                              style: fonts.textSmMedium.copyWith(
                                fontSize: 10.sp,
                                color: colors.constantContrast,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    // Title
                    Text(
                      title,
                      style: fonts.textSmSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Description
                    Text(
                      description,
                      style: fonts.textSmSemiBold.copyWith(
                        fontSize: 12.sp,
                        color: colors.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (badge == null)
                Icon(
                  Icons.arrow_forward_ios,
                  color: isEnabled ? Colors.grey[400] : Colors.grey[300],
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
