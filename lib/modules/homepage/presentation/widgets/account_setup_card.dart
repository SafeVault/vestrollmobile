// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class AccountSetupCard extends StatefulWidget {
  final double progress;
  final VoidCallback? onTap;

  const AccountSetupCard({super.key, this.progress = 0.2, this.onTap});

  @override
  State<AccountSetupCard> createState() => _AccountSetupCardState();
}

class _AccountSetupCardState extends State<AccountSetupCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void didUpdateWidget(AccountSetupCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.progress,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 92.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: colors.brandDefault,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Complete Account Setup',
                    style: fonts.heading3Bold.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: colors.constantContrast,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Finish setting up your account to start\nsending invoices and signing contracts.',
                    style: fonts.textSmRegular.copyWith(
                      fontSize: 12.sp,
                      color: colors.constantContrast.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  width: 52.w,
                  height: 52.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 52.w,
                        height: 52.h,
                        child: CircularProgressIndicator(
                          value: _animation.value,
                          strokeWidth: 4.w,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colors.constantContrast,
                          ),
                          backgroundColor: colors.constantContrast.withOpacity(
                            0.2,
                          ),
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Text(
                        '${(_animation.value * 100).toInt()}%',
                        style: fonts.textSmBold.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: colors.constantContrast,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
