import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/enums/biometric_enum.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/managers/heptic_manager.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/pin_input_section.dart';
import 'package:vestrollmobile/shared/widgets/key_pad.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen>
    with TickerProviderStateMixin {
  static const int _pinLength = 4;

  final List<String> _pin = [];
  String? _createdPin;
  bool _showError = false;
  String _errorMessage = '';
  bool _isConfirmingPin = false;

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onNumberPressed(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin.add(number);
        _showError = false;
      });

      HapticManager.lightImpact();

      if (_pin.length == _pinLength) {
        Future.delayed(const Duration(milliseconds: 100), _verifyPin);
      }
    }
  }

  void _onBackspacePressed() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin.removeLast();
        _showError = false;
      });
      HapticManager.lightImpact();
    }
  }

  void _verifyPin() {
    final enteredPin = _pin.join();

    if (!_isConfirmingPin) {
      setState(() {
        _createdPin = enteredPin;
        _isConfirmingPin = true;
        _pin.clear();
      });
      HapticManager.lightImpact();
    } else {
      if (enteredPin == _createdPin) {
        _handleSuccessfulPinCreation();
      } else {
        _handleIncorrectPin();
      }
    }
  }

  void _handleSuccessfulPinCreation() {
    HapticManager.lightImpact();
    context.pushNamed(RouteConstants.pinCreated);
  }

  void _handleIncorrectPin() {
    HapticManager.heavyImpact();

    setState(() {
      _showError = true;
      _errorMessage = 'PINs do not match. Please try again.';
    });

    _shakeController.forward().then((_) => _shakeController.reset());

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _pin.clear();
          _showError = false;
          _isConfirmingPin = false;
          _createdPin = null;
        });
      }
    });
  }

  void _onBiometricPressed() {
    HapticManager.lightImpact();
    // Implement biometric authentication
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: const VestrollAppBar(isBack: true, title: ''),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                _isConfirmingPin
                    ? 'Confirm Your PIN Code'
                    : 'Create Your PIN Code',
                style: fonts.heading2Bold.copyWith(
                  fontSize: 24.sp,
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                _isConfirmingPin
                    ? 'Re-enter your PIN code to confirm.'
                    : 'Enter a 4 digit code you will use to log in, without entering your login credentials.',
                style: fonts.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  color: colors.textSecondary,
                ),
              ),
              SizedBox(height: 20.h),
              PinInputSection(
                pinLength: _pinLength,
                currentPinLength: _pin.length,
                showError: _showError,
                errorMessage: _errorMessage,
                shakeAnimation: _shakeAnimation,
              ),
              const Spacer(),
              Keypad(
                onNumberPressed: _onNumberPressed,
                onBackspacePressed: _onBackspacePressed,
                onBiometricPressed: _onBiometricPressed,
                biometricType: BiometricType.none,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
