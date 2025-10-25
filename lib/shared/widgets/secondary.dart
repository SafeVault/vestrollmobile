// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    this.backgroundColor,
    required this.text,
    this.isEnabled = true,
    this.icon,
    this.iconRtr,
    this.textColor,
    this.textSize = 16,
    this.borderColor,
    this.fixedSize,
    this.padding,
    required this.onPressed,
    this.borderRadius,
    this.enableShake = true,
    this.enableShine = true,
  });

  final Color? backgroundColor;
  final String text;
  final bool? isEnabled;
  final String? icon;
  final String? iconRtr;
  final Color? textColor;
  final double? textSize;
  final EdgeInsetsGeometry? padding;
  final Size? fixedSize;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final bool enableShake;
  final bool enableShine;

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _shineController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    _shineAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _shineController, curve: Curves.easeInOutCirc),
    );
  }

  Future<void> _triggerSpringEffect() async {
    if (widget.enableShake) {
      await _scaleController.forward();
      await _scaleController.reverse();
    }
  }

  Future<void> _triggerShineEffect() async {
    if (widget.enableShine && (widget.isEnabled ?? true)) {
      _shineController.reset();
      await _shineController.forward();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap:
          widget.isEnabled == true
              ? () async {
                _triggerSpringEffect();
                await _triggerShineEffect();
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.unfocus();
                }
                if (widget.onPressed != null) {
                  widget.onPressed?.call();
                }
              }
              : null,
      child: AnimatedBuilder(
        animation: Listenable.merge([_scaleAnimation, _shineAnimation]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color:
                        widget.isEnabled ?? true
                            ? widget.backgroundColor ??
                                colors.gray950.withAlpha(30)
                            : colors.gray400.withAlpha(100),
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(12.sp),
                    border: Border.all(
                      color:
                          widget.isEnabled ?? false
                              ? widget.borderColor ?? Colors.transparent
                              : Colors.transparent,
                    ),
                  ),
                  padding:
                      widget.padding ?? EdgeInsets.symmetric(vertical: 12.sp),
                  height: widget.fixedSize?.height ?? 48.h,
                  width: widget.fixedSize?.width ?? double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null)
                        SvgPicture.asset(
                          widget.icon ?? '',
                          height: 18.sp,
                          width: 18.sp,
                        )
                      else
                        const SizedBox(),
                      if (widget.icon != null) const SizedBox(width: 12),
                      Text(
                        widget.text,
                        style: fonts.textMdBold.copyWith(
                          fontSize: widget.textSize,
                          color: widget.textColor ?? colors.textPrimary,
                        ),
                      ),
                      if (widget.iconRtr != null) const SizedBox(width: 12),
                      if (widget.iconRtr != null)
                        SvgPicture.asset(
                          widget.iconRtr ?? '',
                          height: 18.sp,
                          width: 18.sp,
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
                ),
                if (widget.enableShine && (widget.isEnabled ?? true))
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(28.sp),
                      child: AnimatedBuilder(
                        animation: _shineAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(
                              _shineAnimation.value *
                                  (MediaQuery.of(context).size.width + 100),
                              _shineAnimation.value * 15,
                            ),
                            child: Transform.rotate(
                              angle: -0.9,
                              child: Container(
                                width: 10,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      colors.bgB0.withAlpha(10),
                                      colors.bgB0.withAlpha(20),
                                      colors.bgB0.withAlpha(10),
                                      Colors.transparent,
                                    ],
                                    stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget.enableShine && (widget.isEnabled ?? true))
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(28.sp),
                      child: AnimatedBuilder(
                        animation: _shineAnimation,
                        builder: (context, child) {
                          double delayedProgress = (_shineAnimation.value + 0.2)
                              .clamp(-1.0, 1.0);

                          return Transform.translate(
                            offset: Offset(
                              delayedProgress *
                                  (MediaQuery.of(context).size.width + 100),
                              delayedProgress * 12,
                            ),
                            child: Transform.rotate(
                              angle: -0.9,
                              child: Container(
                                width: 10,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      colors.bgB0.withAlpha(8),
                                      colors.bgB0.withAlpha(15),
                                      colors.bgB0.withAlpha(8),
                                      Colors.transparent,
                                    ],
                                    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
