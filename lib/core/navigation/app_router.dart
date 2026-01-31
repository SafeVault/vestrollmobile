// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/enums/biometric_enum.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/create_account.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/create_password_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/login_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/new_password.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/pin_code_screen.dart';
import 'package:vestrollmobile/modules/finance/presentation/screens/contract_payment_details_screen.dart';
import 'package:vestrollmobile/modules/finance/presentation/screens/finance_screen.dart';
import 'package:vestrollmobile/modules/finance/presentation/screens/invoice_details_screen.dart';
import 'package:vestrollmobile/modules/finance/presentation/screens/transactions_screen.dart';
import 'package:vestrollmobile/modules/finance/presentation/screens/upcoming_payments_screen.dart';
import 'package:vestrollmobile/modules/homepage/presentation/screens/home_screen.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/screens/account_type_screen.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/screens/address_details.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/screens/create_pin_screen.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/screens/personal_details.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/screens/pin_created_screen.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/screens/profile_created_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/reset_password.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/verify_account_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/verify_otp_screen.dart';
import 'package:vestrollmobile/modules/more/presentation/screens/more_screen.dart';
import 'package:vestrollmobile/modules/more_options/presentation/screens/more_options_screen.dart';
import 'package:vestrollmobile/modules/onboarding/presentation/screens/onboarding_checklist_screen.dart';
import 'package:vestrollmobile/modules/workspace/presentation/screens/workspace_screen.dart';

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
            child: const UpcomingPaymentsScreen(),
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
        path: '/createAccount',
        name: RouteConstants.createAccount,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: CreateAccountScreen(),
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
        path: '/createPassword',
        name: RouteConstants.createPassword,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: CreatePasswordScreen(),
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
        path: '/verifyAccount',
        name: RouteConstants.verifyAccount,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: VerifyAccountScreen(),
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
        path: '/personalDetails',
        name: RouteConstants.personalDetails,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PersonalDetailsScreen(),
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
        path: '/addressDetails',
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
        path: '/profileCreated',
        name: RouteConstants.profileCreated,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ProfileCreatedScreen(),
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
        path: '/createPin',
        name: RouteConstants.createPin,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CreatePinScreen(),
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
        path: '/pinCreated',
        name: RouteConstants.pinCreated,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PinCreatedScreen(),
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

      //////
      GoRoute(
        path: '/moreScreen',
        name: RouteConstants.moreScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const MoreScreen(),
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
        path: '/moreOptionsScreen',
        name: RouteConstants.moreOptionsScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const MoreOptionsScreen(),
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
        path: '/homeScreen',
        name: RouteConstants.homeScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
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
        path: '/financeScreen',
        name: RouteConstants.financeScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const FinanceScreen(),
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
        path: '/workspaceScreen',
        name: RouteConstants.workspaceScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const WorkspaceScreen(),
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

      /////
      GoRoute(
        path: '/accountType',
        name: RouteConstants.accountType,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AccountTypeScreen(),
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
        path: '/upcomingPayments',
        name: RouteConstants.upcomingPayments,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const UpcomingPaymentsScreen(),
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
        path: '/contractPaymentDetails',
        name: RouteConstants.contractPaymentDetails,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ContractPaymentDetailsScreen(),
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
        path: '/invoiceDetails',
        name: RouteConstants.invoiceDetails,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const InvoiceDetailsScreen(),
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
