// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/profile_creation_success_screen.dart';
import 'package:vestrollmobile/modules/authentication/presentation/screens/address_details_screen.dart';
import 'package:vestrollmobile/modules/homepage/presentation/screens/home_screen.dart';

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
        path: '/signUp',
        name: RouteConstants.signUp,
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
    ],
  );

  static GoRouter get router => _router;
}
