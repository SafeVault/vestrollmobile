import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/biometric_enum.dart';
import 'package:vestrollmobile/core/utils/heptic_manager.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/bottom_action.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/pin_input_section.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/pin_login_header.dart';
import 'package:vestrollmobile/shared/widgets/key_pad.dart';

class PinCodeScreen extends StatefulWidget {
  final String userName;
  final BiometricType biometricType;

  const PinCodeScreen({
    super.key,
    required this.userName,
    required this.biometricType,
  });

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen>
    with TickerProviderStateMixin {
  static const int _pinLength = 4;
  static const String _correctPin = "1234";

  final List<String> _pin = [];
  bool _showError = false;
  String _errorMessage = '';

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

    if (enteredPin == _correctPin) {
      _handleSuccessfulLogin();
    } else {
      _handleIncorrectPin();
    }
  }

  void _handleSuccessfulLogin() {
    HapticManager.lightImpact();
    // Navigate to next screen or handle success
  }

  void _handleIncorrectPin() {
    HapticManager.heavyImpact();

    setState(() {
      _showError = true;
      _errorMessage = 'Incorrect PIN. Please try again.';
    });

    _shakeController.forward().then((_) => _shakeController.reset());

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _pin.clear();
          _showError = false;
        });
      }
    });
  }

  void _onBiometricPressed() {
    HapticManager.lightImpact();
    // Implement biometric authentication
  }

  void _onLogout() {
    HapticManager.lightImpact();
    // Handle logout
  }

  void _onForgotPin() {
    HapticManager.lightImpact();
    // Handle forgot PIN
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              PinLoginHeader(userName: widget.userName),
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
                biometricType: widget.biometricType,
              ),
              SizedBox(height: 24.h),
              BottomActions(onLogout: _onLogout, onForgotPin: _onForgotPin),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
