import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const ActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 72.w,
        height: 72.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(icon, size: size.sp, color: colors.textSecondary),
        ),
      ),
    );
  }
}
