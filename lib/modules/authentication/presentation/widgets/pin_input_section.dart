import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/pin_dot_row.dart';

class PinInputSection extends StatelessWidget {
  final int pinLength;
  final int currentPinLength;
  final bool showError;
  final String errorMessage;
  final Animation<double> shakeAnimation;

  const PinInputSection({
    super.key,
    required this.pinLength,
    required this.currentPinLength,
    required this.showError,
    required this.errorMessage,
    required this.shakeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter PIN',
          style: fonts.textMdMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        SizedBox(height: 10.h),
        PinDotsRow(
          pinLength: pinLength,
          currentPinLength: currentPinLength,
          hasError: showError,
          shakeAnimation: shakeAnimation,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child:
              showError
                  ? Padding(
                    key: const ValueKey('error'),
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      errorMessage,
                      style: fonts.textXsMedium.copyWith(
                        color: colors.red500,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                  : SizedBox(key: const ValueKey('no-error'), height: 8.h),
        ),
      ],
    );
  }
}
