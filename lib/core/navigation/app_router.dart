// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/enums/biometric_enum.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/login_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/new_password.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/pin_code_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/profile_creation_success_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/address_details_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/reset_password.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/verify_otp_screen.dart';
import 'package:vestrollmobile/modules/homepage/presentation/screens/home_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/user_type_selection_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: RouteConstants.splash,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/keypad',
        name: RouteConstants.keypad,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PinCodeScreen(
              userName: 'Lewechi',
              biometricType: BiometricType.fingerprint,
            ),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/resetPassword',
        name: RouteConstants.resetPassword,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ResetPassword(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/verifyOtpScreen',
        name: RouteConstants.verifyOtpScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: VerifyOtpScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/newPassword',
        name: RouteConstants.newPassword,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: NewPassword(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/signUp',
        name: RouteConstants.signUp,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/address-details',
        name: RouteConstants.addressDetails,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AddressDetailsScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/profile-creation-success',
        name: RouteConstants.profileCreationSuccess,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ProfileCreationSuccessScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/user-type-selection',
        name: RouteConstants.userTypeSelection,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const UserTypeSelectionScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
