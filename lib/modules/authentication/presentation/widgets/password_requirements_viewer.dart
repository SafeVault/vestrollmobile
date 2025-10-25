import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class PasswordRequirementViewer extends StatelessWidget {
  final bool isPassed;
  final String text;
  const PasswordRequirementViewer({
    required this.isPassed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: isPassed ? colors.green50 : colors.red50,
        border: Border.all(color: isPassed ? colors.green300 : colors.red300),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Icon(
            isPassed ? Icons.check : Icons.close,
            size: 14.sp,
            color: isPassed ? colors.green500 : colors.red500,
          ),
          Text(
            text,

            style: fonts.textSmBold.copyWith(
              fontSize: 12.sp,
              color: isPassed ? colors.green500 : colors.red500,
            ),
          ),
        ],
      ),
    );
  }
}
