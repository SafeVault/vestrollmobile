import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';

// PIN Dot Component
class PinDot extends StatelessWidget {
  final bool isFilled;
  final bool hasError;

  const PinDot({super.key, required this.isFilled, required this.hasError});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color:
              hasError
                  ? colors.red500
                  : isFilled
                  ? colors.brandDefault
                  : colors.gray100,
          width: 1,
        ),
      ),
      child:
          isFilled
              ? Center(
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: hasError ? colors.red500 : colors.brandDefault,
                    shape: BoxShape.circle,
                  ),
                ),
              )
              : null,
    );
  }
}
