import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.color,
    required this.text,
    this.isEnabled = true,
    this.gradient,
    this.icon,
    this.iconRtr,
    this.textColor,
    this.textSize = 16,
    this.borderColor,
    this.fixedSize,
    this.iconColor,
    this.padding,
    required this.onPressed,
    this.borderRadius,
    this.enableShake = true,
    this.enableShine = true,
  });

  final Color? color;
  final String text;
  final bool isEnabled;
  final String? icon;
  final String? iconRtr;
  final Color? textColor;
  final Color? iconColor;
  final double textSize;
  final EdgeInsetsGeometry? padding;
  final bool? gradient;
  final Size? fixedSize;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final bool enableShake;
  final bool enableShine;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with TickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final AnimationController _shineController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
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

  Future<void> _handleTap() async {
    if (!widget.isEnabled || widget.onPressed == null) return;
    _unfocusActiveField();
    final futures = <Future>[];
    if (widget.enableShake) {
      futures.add(_triggerSpringEffect());
    }
    if (widget.enableShine) {
      futures.add(_triggerShineEffect());
    }
    await Future.wait(futures);
    widget.onPressed?.call();
  }

  void _unfocusActiveField() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }
  }

  Future<void> _triggerSpringEffect() async {
    await _scaleController.forward();
    await _scaleController.reverse();
  }

  Future<void> _triggerShineEffect() async {
    _shineController.reset();
    await _shineController.forward();
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
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([_scaleAnimation, _shineAnimation]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: _buildButtonContainer(context, colors, fonts),
          );
        },
      ),
    );
  }

  Widget _buildButtonContainer(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Stack(
      children: [
        _buildMainButton(context, colors, fonts),
        if (widget.enableShine && widget.isEnabled) ...[
          _buildShineEffect(context, colors, 0.0),
          _buildShineEffect(context, colors, 0.2),
        ],
      ],
    );
  }

  Widget _buildMainButton(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: _getButtonDecoration(colors),
      padding: _getButtonPadding(),
      height: widget.fixedSize?.height ?? 48.h,
      width: widget.fixedSize?.width ?? MediaQuery.of(context).size.width - 40,
      child: _buildButtonContent(context, colors, fonts),
    );
  }

  BoxDecoration _getButtonDecoration(ColorSystemExtension colors) {
    return BoxDecoration(
      color:
          widget.isEnabled
              ? widget.color ?? colors.brandDefault
              : colors.gray300.withAlpha(100),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12.sp),
      border: Border.all(
        color:
            widget.isEnabled
                ? widget.borderColor ?? Colors.transparent
                : Colors.transparent,
      ),
    );
  }

  EdgeInsetsGeometry _getButtonPadding() {
    return widget.padding ?? EdgeInsets.symmetric(vertical: 10.sp);
  }

  Widget _buildButtonContent(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) _buildIcon(colors, widget.icon!),
        if (widget.icon != null) SizedBox(width: 10.w),
        _buildButtonText(colors, fonts),
        if (widget.iconRtr != null) SizedBox(width: 7.w),
        if (widget.iconRtr != null) _buildIcon(colors, widget.iconRtr!),
      ],
    );
  }

  Widget _buildIcon(ColorSystemExtension colors, String iconPath) {
    return SvgPicture.asset(
      iconPath,
      height: 18.sp,
      width: 18.sp,
      colorFilter: ColorFilter.mode(
        widget.iconColor ??
            (widget.isEnabled ? colors.textPrimary : colors.gray500),
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildButtonText(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Text(
      widget.text,
      style: fonts.textMdBold.copyWith(
        fontSize: widget.textSize,
        color:
            widget.textColor ??
            (widget.isEnabled ? colors.constantContrast : colors.gray500),
      ),
    );
  }

  Widget _buildShineEffect(
    BuildContext context,
    ColorSystemExtension colors,
    double delay,
  ) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(200.sp),
        child: AnimatedBuilder(
          animation: _shineAnimation,
          builder: (context, child) {
            final delayedProgress = (_shineAnimation.value + delay).clamp(
              -1.0,
              1.0,
            );
            return Transform.translate(
              offset: Offset(
                delayedProgress * (MediaQuery.of(context).size.width + 100),
                delayedProgress * (delay == 0.0 ? 15 : 12),
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
                      colors: _getShineColors(colors, delay == 0.0),
                      stops:
                          delay == 0.0
                              ? const [0.0, 0.2, 0.5, 0.8, 1.0]
                              : const [0.0, 0.25, 0.5, 0.75, 1.0],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Color> _getShineColors(ColorSystemExtension colors, bool isPrimary) {
    final baseColor = colors.bgB0;
    if (isPrimary) {
      return [
        Colors.transparent,
        baseColor.withAlpha(20),
        baseColor.withAlpha(50),
        baseColor.withAlpha(20),
        Colors.transparent,
      ];
    } else {
      return [
        Colors.transparent,
        baseColor.withAlpha(15),
        baseColor.withAlpha(40),
        baseColor.withAlpha(15),
        Colors.transparent,
      ];
    }
  }
}
