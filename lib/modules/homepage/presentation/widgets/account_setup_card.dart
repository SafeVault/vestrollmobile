// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class AccountSetupCard extends StatefulWidget {
  final double progress;
  final VoidCallback? onTap;
  final bool enableBlinking;

  const AccountSetupCard({
    super.key,
    this.progress = 0.2,
    this.onTap,
    this.enableBlinking = true,
  });

  @override
  State<AccountSetupCard> createState() => _AccountSetupCardState();
}

class _AccountSetupCardState extends State<AccountSetupCard>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _pulseController;
  late Animation<double> _progressAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.progress,
    ).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _progressController.forward();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    if (widget.enableBlinking && widget.progress < 1.0) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AccountSetupCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.progress,
      ).animate(
        CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
      );
      _progressController.forward(from: 0.0);

      if (widget.progress >= 1.0) {
        _pulseController.stop();
        _pulseController.value = 0.0;
      } else if (widget.enableBlinking && !_pulseController.isAnimating) {
        _pulseController.repeat(reverse: true);
      }
    }

    if (oldWidget.enableBlinking != widget.enableBlinking) {
      if (widget.enableBlinking && widget.progress < 1.0) {
        _pulseController.repeat(reverse: true);
      } else {
        _pulseController.stop();
        _pulseController.value = 0.0;
      }
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: colors.constantContrast.withOpacity(
                  0.5 * _pulseAnimation.value,
                ),
                blurRadius: 30 + (30 * _pulseAnimation.value),
                spreadRadius: 8 * _pulseAnimation.value,
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: colors.constantContrast.withOpacity(
                  0.7 * _pulseAnimation.value,
                ),
                blurRadius: 20 + (20 * _pulseAnimation.value),
                spreadRadius: 6 * _pulseAnimation.value,
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: colors.constantContrast.withOpacity(
                  0.9 * _pulseAnimation.value,
                ),
                blurRadius: 10 + (15 * _pulseAnimation.value),
                spreadRadius: 3 * _pulseAnimation.value,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: widget.onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2 * _pulseAnimation.value,
                  sigmaY: 2 * _pulseAnimation.value,
                ),
                child: Container(
                  height: 92.h,
                  decoration: BoxDecoration(
                    color: colors.brandDefault,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: colors.constantContrast.withOpacity(
                        0.1 + (0.9 * _pulseAnimation.value),
                      ),
                      width: 4.w,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
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
                        animation: _progressAnimation,
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
                                    value: _progressAnimation.value,
                                    strokeWidth: 4.w,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      colors.constantContrast,
                                    ),
                                    backgroundColor: colors.constantContrast
                                        .withOpacity(0.2),
                                    strokeCap: StrokeCap.round,
                                  ),
                                ),
                                Text(
                                  '${(_progressAnimation.value * 100).toInt()}%',
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
              ),
            ),
          ),
        );
      },
    );
  }
}
